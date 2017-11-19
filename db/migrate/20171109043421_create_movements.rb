class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.string :action, null: false
      t.references :product, foreign_key: true
      t.integer :amount, null: false
      t.date :shelfLife
      t.integer :lifeCycle
      t.decimal :unitaryValue, null: false
      t.decimal :value, null: false
      t.date :data, null: false
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
