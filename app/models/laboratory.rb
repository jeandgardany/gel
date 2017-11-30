class Laboratory < ApplicationRecord
has_many :products
has_many :reserves

accepts_nested_attributes_for :reserves, :products

validates :code, :name, :description, :capacity, presence: true
validates :name, :code, uniqueness: true

  def self.search(query)

  	where("name LIKE :q", :q => "%#{query}%")
  	
  end
end
