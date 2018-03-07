class CreateValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :validations do |t|
      t.string :status, null: false

      t.timestamps
    end
  end
end
