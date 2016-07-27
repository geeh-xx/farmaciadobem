class PerfisController < ApplicationController
  before_action :authenticate_user!
  before_action :carrega_usuario

  def edit
    @perfil = Perfil.find params[:id]
    @enderecos = @user.enderecos.all.reverse_order
  end

  def update
    @perfil = Perfil.find params[:id]
    if @perfil.update_attributes(perfil_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  def new
    @enderecos = @user.enderecos.all.reverse_order
  end

  def create
    @perfil = Perfil.new perfil_params
    @perfil.user = @user
    if @perfil.save
      flash[:notice] = "Informações salvas com sucesso."
      respond_to do |format|
        format.html { redirect_to edit_perfi_path(@perfil), notice: 'Informações salvas com sucesso.' }
      @user.perfil = @perfil
      @user.save
      end
    else
      render 'edit'
    end
  end

  private
    def perfil_params
      params.require(:perfil).permit :nome, :email, :telefone
    end

    def carrega_usuario
      @user = User.find(current_user.id)
    end

end
