class CreateSolicitations < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitations do |t|
      t.string :description, null: false
      t.references :employee, foreign_key: true
      t.references :movement, foreign_key: true

      t.timestamps
    end
  end
end
