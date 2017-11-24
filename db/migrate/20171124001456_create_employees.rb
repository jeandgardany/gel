class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
