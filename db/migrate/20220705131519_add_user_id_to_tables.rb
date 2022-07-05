class AddUserIdToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :user_id, :integer
  end
end
