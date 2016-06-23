class AddLocationAndPhotoToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :photo, index: true, foreign_key: true
    add_reference :users, :location, index: true, foreign_key: true
  end
end
