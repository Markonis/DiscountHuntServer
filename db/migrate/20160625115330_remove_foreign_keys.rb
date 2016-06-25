class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :users, :locations
    remove_foreign_key :users, :photos
    remove_foreign_key :discounts, :locations
    remove_foreign_key :discounts, :photos
  end
end
