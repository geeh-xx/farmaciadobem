class ControlDoacaosController < ApplicationController
  before_action :authenticate_user!

  def index
    @doacoes = Doacao.all.reverse_order
    authorize @doacoes
  end
end
