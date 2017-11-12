class Stock < ApplicationRecord
  has_many :laboratories
  has_many :products
  
  validates :amount, :laboratory_id, :product_id, presence: true
end
