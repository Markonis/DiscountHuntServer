class AddPasswordIvToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password_iv, :string
  end
end
