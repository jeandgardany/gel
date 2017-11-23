class CreatePatrimonies < ActiveRecord::Migration[5.1]
  def change
    create_table :patrimonies do |t|
      t.string :tag, null: false, unique: true
      t.references :movement, foreign_key: true

      t.timestamps
    end
  end
end
