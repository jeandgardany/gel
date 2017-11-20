class Movement < ApplicationRecord
  belongs_to :product
  has_many :stocks

  accepts_nested_attributes_for :product, :stocks

  scope :inputs, -> { where action: 'Entrada' }
  scope :exits, -> { where action: 'Saida' }

 def stock_laboratory_name
    if self.stock.laboratory.blank?
      "Sem Cadastro"
    else
      self.stock.laboratory.name
    end
 end

end
