class SetLocationScaleAndPrecision < ActiveRecord::Migration
  def change
    change_column :locations, :lat, :decimal, scale: 6, precision: 10
    change_column :locations, :lng, :decimal, scale: 6, precision: 10
  end
end
