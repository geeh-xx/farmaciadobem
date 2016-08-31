class ControlMedicamentosController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Medicamento.ransack(params[:q])
    @medicamentos = @q.result
    authorize @medicamentos
  end

end
