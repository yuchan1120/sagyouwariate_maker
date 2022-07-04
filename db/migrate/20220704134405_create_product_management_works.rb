class CreateProductManagementWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :product_management_works do |t|
      t.string :name
      t.integer :time_required
      t.integer :user_id

      t.timestamps
    end
  end
end
