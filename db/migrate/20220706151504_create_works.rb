class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :name
      t.integer :time_required
      t.integer :user_id
      t.integer :taxon_id

      t.timestamps
    end
  end
end
