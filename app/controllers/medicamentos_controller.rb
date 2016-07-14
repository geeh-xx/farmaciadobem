class MedicamentosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @q = Medicamento.ransack(params[:q])
    @medicamentos = @q.result

    # if params[:search].nil?
    #   @medicamentos = Medicamento.all.reverse_order
    # else
    #   @medicamentos = Medicamento.where(nome: params[:search])
    # end
  end

  def show
    @medicamento = Medicamento.find params[:id]
  end

  def edit
    @medicamento = Medicamento.find params[:id]
  end

  def update
    @medicamento = Medicamento.find params[:id]
    if @medicamento.update_attributes(medicamento_params)
      redirect_to @medicamento
    else
      render 'edit'
    end
  end

  def destroy
    @medicamento = Medicamento.find params[:id]
    @medicamento.destroy
    redirect_to action: 'index'
  end

  def new
  end

  def create
    @medicamento = Medicamento.new medicamento_params
    if @medicamento.save
      flash[:notice] = "Informações salvas com sucesso."
      respond_to do |format|
        format.html { redirect_to action: 'index', notice: 'Medicamento salvo com sucesso.' }
      end
    else
      render 'new'
    end
  end

  private
  def medicamento_params
    params.require(:medicamento).permit :nome, :tipo, :validade
  end

end
