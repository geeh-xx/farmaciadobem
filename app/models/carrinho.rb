class Carrinho < ActiveRecord::Base
  enum role: [:ativo, :desativo]
  has_many :items, dependent: :destroy
  belongs_to :user

  def retorna_status
    if active == 0
      "Solicitado"
    else
      "Entregue"
    end
  end

end
