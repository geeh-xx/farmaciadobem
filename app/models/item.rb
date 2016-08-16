class Item < ActiveRecord::Base
  belongs_to :medicamento
  belongs_to :carrinho
end
