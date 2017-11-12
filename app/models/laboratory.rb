class Laboratory < ApplicationRecord
has_many :products

	validates :code, :name, :description, :capacity, presence: true

end
