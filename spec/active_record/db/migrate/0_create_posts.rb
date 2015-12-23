class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :status
    end
  end
end
