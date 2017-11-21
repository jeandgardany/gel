class Stock < ApplicationRecord
  belongs_to :laboratory
  has_one :movement
  
  validates :laboratory_id, presence: true
  accepts_nested_attributes_for :laboratory, :movement

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

  def self.hired_since ( date )
     where( ' start_date> =? ' , date)
  end

end