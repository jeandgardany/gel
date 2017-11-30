class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.references :product, foreign_key: true
      t.integer :amount, null: false
      t.references :reserve, foreign_key: true

      t.timestamps
    end
  end
end
