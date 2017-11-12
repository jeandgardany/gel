class Product < ApplicationRecord
  belongs_to :category
  has_many :inputs

  validates :name, :code, :name, :category_id, :description, presence: true
end
