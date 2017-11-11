class Input < ApplicationRecord
  belongs_to :laboratory
  belongs_to :product

  accepts_nested_attributes_for :laboratory
  accepts_nested_attributes_for :product
# Verifica se já existe uma comissão, caso sim atualiza, caso não cria uma nova.
    if self.input_select.present?
      self.stock.update(laboratory_id: (current_loboratory_id), produto_id: (current_product_id), amount: (current_amount))
    else
      Input.stock.create(laboratory_id: (current_loboratory_id), produto_id: (current_product_id), amount: (current_amount))
    end
end
