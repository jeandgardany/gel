class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.references :employee, foreign_key: true
      t.string :description
      t.references :laboratory, foreign_key: true
      t.string :shift
      t.date :date
      t.time :startTime
      t.time :endTime

      t.timestamps
    end
  end
end
