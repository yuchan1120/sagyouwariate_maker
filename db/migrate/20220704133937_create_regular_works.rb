class CreateRegularWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :regular_works do |t|
      t.string :name
      t.integer :time_required
      t.integer :user_id

      t.timestamps
    end
  end
end
