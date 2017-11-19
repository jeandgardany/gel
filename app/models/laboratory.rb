class Laboratory < ApplicationRecord
has_many :products

	validates :code, :name, :description, :capacity, presence: true
	validates :name, :code, uniqueness: true

  def self.search(query)

  	where("name LIKE :q", :q => "%#{query}%")
  	
  end
end
