class AddFriendsWithToUserSearch < ActiveRecord::Migration
  def change
    add_column :user_searches, :friends_with, :integer
  end
end
