class AddValidationToReserve < ActiveRecord::Migration[5.1]
  def change
  	add_column :reserves, :validation_id, :integer, default: 1
  end
end
