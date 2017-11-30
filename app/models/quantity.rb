class Quantity < ApplicationRecord
  belongs_to :product
  belongs_to :reserve

  accepts_nested_attributes_for :product, :reserve, reject_if: :all_blank, allow_destroy: true
end
