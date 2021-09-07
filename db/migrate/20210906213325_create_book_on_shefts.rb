class CreateBookOnShefts < ActiveRecord::Migration[6.1]
  def change

    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.integer :year
      t.integer :totalPage

      t.timestamps
    end

    create_table :book_on_shefts do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :total

      t.timestamps
    end
  end
end
