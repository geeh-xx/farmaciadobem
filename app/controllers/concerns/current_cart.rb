module CurrentCart
  extend ActiveSupport::Concern

  private
  def set_cart
    Carrinho.find(session[:carrinho_id])
  rescue ActiveRecord::RecordNotFound
    carrinho = Carrinho.create(user_id: current_user.id, data: DateTime.now)
    session[:carrinho_id] = carrinho.id
    carrinho
  end

  #
  # private
  #   def set_cart
  #     @carrinho = Carrinho.find(session[:carrinho_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @carrinho = Carrinho.create
  #     session[:carrinho_id] = @carrinho.id
  #   end
end