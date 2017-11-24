class Patrimony < ApplicationRecord
  belongs_to :movement

  #validates :tag, uniqueness: true, uniqueness: {message: 'Etiqueta já existe, coloque outro'}

  accepts_nested_attributes_for :movement, reject_if: :all_blank, allow_destroy: true

end
