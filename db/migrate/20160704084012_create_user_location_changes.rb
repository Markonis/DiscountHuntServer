class CreateUserLocationChanges < ActiveRecord::Migration
  def change
    create_table :user_location_changes do |t|
      t.references :user, index: true
      t.references :location, index: true

      t.timestamps null: false
    end
  end
end
