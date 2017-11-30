class Movement < ApplicationRecord
  belongs_to :product
  has_many :stocks
  has_many :patrimonies
  has_one :solicitation

  accepts_nested_attributes_for :product, :stocks
  accepts_nested_attributes_for :patrimonies, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :solicitation, reject_if: :all_blank, allow_destroy: true

  scope :inputs, -> { where action: 'Entrada' }
  scope :exits, -> { where action: 'Saida' }

 def stock_laboratory_name
    if self.movement.stock.laboratory.blank?
      "Sem Cadastro"
    else
      self.movement.stock.laboratory.name
    end
 end

 def employee_name
    if self.employee.blank?
      "Sem Cadastro"
    else
      self.employee.name
    end
 end

 def solicitation_employee_name
    if self.solicitation.blank?
      "Sem Cadastro"
    else
      self.solicitation.employee.name
    end
 end

 def solicitation_employee_office_name
    if self.solicitation.blank?
      "Sem Cadastro"
    else
      self.solicitation.employee.office.name
    end
 end

 def solicitation_description
    if self.solicitation.blank?
      "Sem Cadastro"
    else
      self.solicitation.description
    end
 end

end
