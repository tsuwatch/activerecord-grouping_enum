require 'spec_helper'

describe ActiveRecord::GroupingEnum do
  class Post < ActiveRecord::Base
    enum status: { editing: 0, closed: 1, published: 2, deleted: 3, admin_deleted: 4 }
    grouping_enum status: {
      undeleted: [:editing, :closed, :published]
    }
  end

  it { expect(Post).to respond_to(:grouping_enum) }
  it { expect { Post.grouping_enum status: { deleted: [:deleted] } }.to raise_error ArgumentError }

  describe '.undeleted' do
    subject { Post }

    let!(:editing_post) { Post.create(status: :editing) }
    let!(:closed_post) { Post.create(status: :closed) }
    let!(:published_post) { Post.create(status: :published) }
    let!(:deleted_post) { Post.create(status: :deleted) }

    it { expect(subject.undeleted.to_a).to eq [editing_post, closed_post, published_post] }
  end

  describe '#undeleted?' do
    subject { Post.create(attr) }
    let(:attr) { { status: :editing } }

    it { is_expected.to respond_to(:undeleted?) }

    context 'status is closed' do
      let(:attr) { { status: :closed } }

      it { expect(subject.undeleted?).to eq true }
    end

    context 'status is published' do
      let(:attr) { { status: :published } }

      it { expect(subject.undeleted?).to eq true }
    end

    context 'status is deleted' do
      let(:attr) { { status: :deleted } }

      it { expect(subject.undeleted?).to eq false }
    end
  end
end
