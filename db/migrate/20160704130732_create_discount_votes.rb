class CreateDiscountVotes < ActiveRecord::Migration
  def change
    create_table :discount_votes do |t|
      t.references :user, index: true
      t.references :discount, index: true

      t.timestamps null: false
    end
  end
end
