class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :amount, null: false
      t.references :laboratory, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
