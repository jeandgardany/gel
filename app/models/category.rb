class Category < ApplicationRecord
	has_many :products, inverse_of: :category

	validates :name, presence: true
	accepts_nested_attributes_for :products

end
