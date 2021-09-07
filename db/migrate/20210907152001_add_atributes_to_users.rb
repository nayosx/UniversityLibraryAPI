class AddAtributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_hash, :string
  end
end
