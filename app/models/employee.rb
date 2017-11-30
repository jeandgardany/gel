class Employee < ApplicationRecord
	belongs_to :office
	has_many :reserves

	accepts_nested_attributes_for :reserves

	accepts_nested_attributes_for :office, reject_if: :all_blank, allow_destroy: true
	validates :name, presence: true
	validates :code, presence: true, uniqueness: true

	def office_name
	    if self.office.blank?
	      "Sem Cadastro"
	    else
	      self.office.name
	    end
	end

end
