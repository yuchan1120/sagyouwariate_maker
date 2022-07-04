class AddTitleToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :title, :string
  end
end
