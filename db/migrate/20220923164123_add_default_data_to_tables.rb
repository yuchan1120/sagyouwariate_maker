class AddDefaultDataToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :default_data, :boolean, null: false, default: false
  end
end
