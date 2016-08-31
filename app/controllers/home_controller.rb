class HomeController < ApplicationController

  def index

    @q = Medicamento.ransack(params[:q])
    if !@q.nil?
      @medicamentos = Medicamento.last(4).reverse
    else
      @medicamentos = @q.result
    end
    @depoimentos = Depoimento.last(2).reverse
    @item = Item.new

    if user_signed_in?
      @user = User.find(current_user.id)
    end

  end


end
