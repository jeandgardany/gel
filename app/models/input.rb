class Input < ApplicationRecord
  belongs_to :laboratory
  belongs_to :product

  accepts_nested_attributes_for :laboratory
  accepts_nested_attributes_for :product
end
