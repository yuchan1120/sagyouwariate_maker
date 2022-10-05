class AddCellsToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :cells, :string, array: true, default: []
  end
end
