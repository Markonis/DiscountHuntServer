class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :votes
      t.decimal :price

      t.timestamps null: false
    end
  end
end
