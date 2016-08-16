class Medicamento < ActiveRecord::Base
  belongs_to :doacao
  has_many :items
end
