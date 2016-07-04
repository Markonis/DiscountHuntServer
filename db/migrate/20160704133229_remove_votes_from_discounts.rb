class RemoveVotesFromDiscounts < ActiveRecord::Migration
  def change
    remove_column :discounts, :votes
  end
end
