class CreateUserDevices < ActiveRecord::Migration
  def change
    create_table :user_devices do |t|
      t.string :hardware_uuid
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
