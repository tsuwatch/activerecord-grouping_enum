class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :status
      t.integer :user_id
    end
  end
end
