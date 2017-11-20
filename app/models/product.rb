class Product < ApplicationRecord
  belongs_to :category

  validates :name, :code, :description, presence: true
  validates :code, uniqueness: true
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes[:name].blank? }

  def self.search(query)

  	where("name like ?", "%#{query}%")
  	
  end
end
