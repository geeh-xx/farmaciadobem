class HomeController < ApplicationController
  def index
    @medicamentos = Medicamento.last(5).reverse
  end
end
