class AddSatusToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :status, :string, default: 'pending'
  end
end
