class AddDefaultValuesToSettings < ActiveRecord::Migration
  def change
    change_column :settings, :search_radius, :integer, default: 5
    change_column :settings, :enable_background_process, :boolean, default: true
  end
end
