class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.references :category, foreign_key: true
      t.string :description
      t.string :provider

      t.timestamps
    end
  end
end
