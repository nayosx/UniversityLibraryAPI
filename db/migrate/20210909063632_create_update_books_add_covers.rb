class CreateUpdateBooksAddCovers < ActiveRecord::Migration[6.1]
  def change
      change_column :books, :img, :string, default: "book_cover.png"
  end
end
