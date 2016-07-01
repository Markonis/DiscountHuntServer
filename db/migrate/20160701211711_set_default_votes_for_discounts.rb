class SetDefaultVotesForDiscounts < ActiveRecord::Migration
  def change
    change_column :discounts, :votes, :integer, default: 0
  end
end
