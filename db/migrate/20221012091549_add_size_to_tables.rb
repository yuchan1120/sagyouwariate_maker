class AddSizeToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :size, :integer, null: false,   default: 1
  end
end
