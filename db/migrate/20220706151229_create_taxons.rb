class CreateTaxons < ActiveRecord::Migration[6.1]
  def change
    create_table :taxons do |t|
      t.string :name

      t.timestamps
    end
  end
end
