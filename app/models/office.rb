class Office < ApplicationRecord
  has_many :employees

  accepts_nested_attributes_for :employees, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true, uniqueness: true

 def employee_name
    if self.employee.blank?
      "Sem Cadastro"
    else
      self.employee.name
    end
  end

end
