class AddUserDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
  end
end
