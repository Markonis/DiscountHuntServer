class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.references :user, index: true
      t.text :token

      t.timestamps null: false
    end
  end
end
