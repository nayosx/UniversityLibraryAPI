class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :rol, null: false, foreign_key: true
      t.string :name
      t.string :lastname
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
