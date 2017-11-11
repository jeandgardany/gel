class CreateInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inputs do |t|
      t.references :laboratory, foreign_key: true
      t.references :product, foreign_key: true
      t.date :shelfLife
      t.integer :lifeCycle
      t.integer :amount, null: false
      t.decimal :unitaryValue
      t.decimal :value
      t.date :date

      t.timestamps
    end
  end
end
