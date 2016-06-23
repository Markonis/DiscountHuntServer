class AddLocationAndPhotoToDiscounts < ActiveRecord::Migration
  def change
    add_reference :discounts, :photo, index: true, foreign_key: true
    add_reference :discounts, :location, index: true, foreign_key: true
  end
end
