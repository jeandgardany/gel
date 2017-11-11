class Stock < ApplicationRecord
  has_many :laboratories
  has_many :products
  
end
