class ControlCarrinhosController < ApplicationController
  before_action :authenticate_user!

  def index
    @carrinhos = Carrinho.all
    authorize @carrinhos
  end
end
