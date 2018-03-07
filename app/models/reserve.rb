class Reserve < ApplicationRecord
  belongs_to :employee
  belongs_to :laboratory
  has_many :quantities
  belongs_to :validation

  accepts_nested_attributes_for :employee, :laboratory, :quantities, :validation, reject_if: :all_blank, allow_destroy: true

  def self.search(query)

  	where("status LIKE :q", :q => "%#{query}%")
  	
  end

end
