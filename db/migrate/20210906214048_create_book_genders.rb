class CreateBookGenders < ActiveRecord::Migration[6.1]
  def change
    create_table :book_genders do |t|
      t.references :book, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
