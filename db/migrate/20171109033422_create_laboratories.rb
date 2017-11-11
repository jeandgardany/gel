class CreateLaboratories < ActiveRecord::Migration[5.1]
  def change
    create_table :laboratories do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.string :description
      t.integer :capacity

      t.timestamps
    end
  end
end
