class CreateExits < ActiveRecord::Migration[5.1]
  def change
    create_table :exits do |t|
      t.references :stock, foreign_key: true
      t.integer :amount, null: false
      t.date :date
      t.string :comment

      t.timestamps
    end
  end
end
