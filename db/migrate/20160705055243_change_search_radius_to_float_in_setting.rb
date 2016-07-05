class ChangeSearchRadiusToFloatInSetting < ActiveRecord::Migration
  def change
    change_column :settings, :search_radius, :float, default: 0.5
  end
end
