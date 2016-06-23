class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :enable_background_process
      t.integer :search_radius
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
