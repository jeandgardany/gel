class Solicitation < ApplicationRecord
belongs_to :employee
belongs_to :movement

accepts_nested_attributes_for :movement, :employee, reject_if: :all_blank, allow_destroy: true

	def office_name
	    if self.office.blank?
	      "Sem Cadastro"
	    else
	      self.office.name
	    end
	end

end
