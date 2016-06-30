class CreateDiscountSearches < ActiveRecord::Migration
  def change
    create_table :discount_searches do |t|
      t.text :query
      t.text :result
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
