class ControlMedicamentosController < ApplicationController

  def index
    @q = Medicamento.ransack(params[:q])
    @medicamentos = @q.result
    authorize @medicamentos
  end

end
