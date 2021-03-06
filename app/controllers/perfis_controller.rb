class PerfisController < ApplicationController
  before_action :authenticate_user!
  before_action :carrega_usuario
  before_action :set_perfil, only: [:show]


  def edit
    @perfil = Perfil.find params[:id]

    if @perfil.user.id == current_user.id
      @enderecos = @user.enderecos.all.reverse_order
    else
      respond_to do |format|
        format.html { redirect_to home_index_path}
        format.json { render :show, status: :created, location: home_index_path }
      end
    end

  end

  def update
    @perfil = Perfil.find params[:id]

    if @perfil.update_attributes(perfil_params)
      render 'edit'
    else
      render 'edit'
    end

  end

  def show
    begin
      @perfil = Perfil.find(params[:id])
      if @perfil.user.id == current_user.id || @user.admin?
        @enderecos = @perfil.user.enderecos.all.reverse_order
        respond_to do |format|
          format.html # show.html.erb
          format.json { render :show, status: :created, location: @perfil }
        end
      else
        respond_to do |format|
          format.html { redirect_to home_index_path}
          format.json { render :show, status: :created, location: home_index_path }
        end
      end
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

    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

end
