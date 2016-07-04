class AddRadiusToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :radius, :float, default: 0
  end
end
