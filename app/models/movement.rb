class Movement < ApplicationRecord
  belongs_to :product
  has_many :stocks

  accepts_nested_attributes_for :product, :stocks

  scope :inputs, -> { where action: 'Entrada' }
  scope :exits, -> { where action: 'Saida' }

end
