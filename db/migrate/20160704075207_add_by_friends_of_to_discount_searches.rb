class AddByFriendsOfToDiscountSearches < ActiveRecord::Migration
  def change
    add_column :discount_searches, :by_friends_of, :integer
  end
end
