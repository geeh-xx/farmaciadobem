class MedicamentosController < ApplicationController

  def index

    if params[:search]
      @medicamentos = Medicamento.all.reverse_order
    else
      @medicamentos = Medicamento.where(medicamento: params[:search])
    end

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
    @medicamento = Medicamento.new user_params
    if @medicamento.save
      redirect_to @medicamento
    else
      render 'new'
    end
  end

  private
  def medicamento_params
    params.require(:medicamento).permit :medicamento, :name, :email, :tel, :picture
  end

end
