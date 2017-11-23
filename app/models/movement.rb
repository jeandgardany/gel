class Movement < ApplicationRecord
  belongs_to :product
  has_many :stocks
  has_many :patrimonies

  accepts_nested_attributes_for :product, :stocks
  accepts_nested_attributes_for :patrimonies, reject_if: :all_blank, allow_destroy: true

  scope :inputs, -> { where action: 'Entrada' }
  scope :exits, -> { where action: 'Saida' }

 def stock_laboratory_name
    if self.movement.stock.laboratory.blank?
      "Sem Cadastro"
    else
      self.movement.stock.laboratory.name
    end
 end

end
