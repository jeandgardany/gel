class Stock < ApplicationRecord
  has_many :laboratories
  has_one :movement
  
  validates :laboratory_id, presence: true
  accepts_nested_attributes_for :laboratories, :movement

   def self.search(query)

  	where("laboratory_id LIKE :q", :q => "%#{query}%")
  	
  end
end
