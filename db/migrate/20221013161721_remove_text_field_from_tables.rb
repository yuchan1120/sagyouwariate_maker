class RemoveTextFieldFromTables < ActiveRecord::Migration[6.1]
  def change
    96.times do |num|
      remove_column :tables, "a#{num + 1}".to_sym, :string
      remove_column :tables, "b#{num + 1}".to_sym, :string
      remove_column :tables, "c#{num + 1}".to_sym, :string
      remove_column :tables, "d#{num + 1}".to_sym, :string
    end
  end
end
