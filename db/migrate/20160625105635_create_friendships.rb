class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_a_id, index: true
      t.integer :user_b_id, index: true

      t.timestamps null: false
    end
  end
end
