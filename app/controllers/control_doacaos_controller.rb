class ControlDoacaosController < ApplicationController
  def index
    @doacoes = Doacao.all.reverse_order
  end
end
