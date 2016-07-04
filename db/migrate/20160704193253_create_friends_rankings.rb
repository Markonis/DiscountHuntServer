class CreateFriendsRankings < ActiveRecord::Migration
  def change
    create_table :friends_rankings do |t|
      t.references :user, index: true
      t.text :result

      t.timestamps null: false
    end
  end
end
