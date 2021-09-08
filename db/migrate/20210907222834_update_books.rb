class UpdateBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :img, :string
  end
end
