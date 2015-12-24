require 'spec_helper'

describe ActiveRecord::GroupingEnum do
  it { expect(Post).to respond_to(:grouping_enum) }
end
