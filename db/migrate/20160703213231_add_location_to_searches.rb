class AddLocationToSearches < ActiveRecord::Migration
  def change
    add_column :discount_searches, :location_id, :integer
    add_column :user_searches, :location_id, :integer
  end
end
