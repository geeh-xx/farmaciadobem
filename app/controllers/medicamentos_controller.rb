class MedicamentosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_medicamento, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @medicamento.update(medicamento_params)
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
    @depoimentos = Depoimento.all
    @medicamento = Medicamento.new
  end

  def create
    @depoimentos = Depoimento.all
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

  def set_medicamento
    @medicamento = Medicamento.find(params[:id])
  end

  private

    def medicamento_params
      params.require(:medicamento).permit :nome, :tipo, :validade, :doacao_id, :avatar, :active
    end

    def carrega_usuario
      @user = User.find(current_user.id)
    end

end
