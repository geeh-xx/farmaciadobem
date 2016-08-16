module CurrentCart
  extend ActiveSupport::Concern

  private
  def set_cart
    Carrinho.find(session[:carrinho_id])
  rescue ActiveRecord::RecordNotFound
    @user = User.find(current_user.id)
    carrinho = @user.carrinhos.build
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