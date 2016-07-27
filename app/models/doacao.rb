class Doacao < ActiveRecord::Base
  belongs_to :user
  has_many :medicamentos

  accepts_nested_attributes_for :medicamentos, reject_if:  :all_blank, allow_destroy: true
end
