class AddUserIdToDiscounts < ActiveRecord::Migration
  def change
    add_reference :discounts, :user, index: true, foreign_key: true
  end
end
