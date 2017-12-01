class Stock < ApplicationRecord
  belongs_to :laboratory
  has_one :movement
  #has_one :solicitation, through: :movement
  #has_many :patrimonies
  
  validates :laboratory_id, presence: true
  accepts_nested_attributes_for :laboratory, :movement, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :solicitation, reject_if: :all_blank, allow_destroy: true

  def self.search(query)

  	where("laboratory_id like ?", "%#{query}%")
  	
  end

  def laboratory_name
    if self.laboratory.blank?
      "Sem Cadastro"
    else
      self.laboratory.name
    end
  end

  def employee_name
    if self.employee.blank?
      "Sem Cadastro"
    else
      self.employee.name
    end
  end

  def self.hired_since ( date )
     where( ' start_date> =? ' , date)
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

 def movement_action
    if self.movement.blank?
      "Sem Cadastro"
    else
      self.movement.action
    end
  end

  def movement_product_name
    if self.movement.blank?
      "Sem Cadastro"
    else
      self.movement.product.name
    end
  end

end