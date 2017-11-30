class Solicitation < ApplicationRecord
belongs_to :employee
has_many :movements

accepts_nested_attributes_for :movements, :employee, reject_if: :all_blank, allow_destroy: true

	def office_name
	    if self.office.blank?
	      "Sem Cadastro"
	    else
	      self.office.name
	    end
	end

end
