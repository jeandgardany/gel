class Reserve < ApplicationRecord
  belongs_to :employee
  belongs_to :laboratory
  has_many :quantities

  accepts_nested_attributes_for :employee, :laboratory, :quantities, reject_if: :all_blank, allow_destroy: true

end
