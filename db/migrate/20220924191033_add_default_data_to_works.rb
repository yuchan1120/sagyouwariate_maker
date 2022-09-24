class AddDefaultDataToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :default_data, :boolean, null: false, default: false
  end
end
