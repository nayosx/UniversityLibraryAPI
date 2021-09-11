class AddColumnBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :stock, :integer, default: 0
    add_column :books, :stockActual, :integer, default: 0
  end
end
