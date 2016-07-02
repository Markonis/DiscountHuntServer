class CreateUserSearches < ActiveRecord::Migration
  def change
    create_table :user_searches do |t|
      t.string :query
      t.string :hardware_uuid
      t.text :result
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
