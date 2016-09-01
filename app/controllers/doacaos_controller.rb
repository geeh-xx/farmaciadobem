class DoacaosController < ApplicationController
  before_action :set_doacao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :carrega_usuario

  # GET /doacaos
  # GET /doacaos.json
  def index
    @doacaos = @user.doacaos.all.reverse_order
    @doacao = @user.doacaos.last
  end

  # GET /doacaos/1
  # GET /doacaos/1.json
  def show
    begin
      @doacao = Doacao.find(params[:id])
      if @doacao.user.id == current_user.id || @user.admin? 
        @medicamentos = @doacao.medicamentos
        respond_to do |format|
          format.html # show.html.erb
          format.json { render :show, status: :created, location: @endereco }
        end
      else
        respond_to do |format|
          format.html { redirect_to home_index_path}
          format.json { render :show, status: :created, location: home_index_path }
        end
      end
    end
  end

  # GET /doacaos/new
  def new
    @doacao = Doacao.new
    @depoimentos = Depoimento.all
    @enderecos = @user.enderecos.all.reverse_order
  end

  # GET /doacaos/1/edit
  def edit
  end

  # POST /doacaos
  # POST /doacaos.json
  def create
    @depoimentos = Depoimento.all
    @doacao = Doacao.new(doacao_params)
    respond_to do |format|
      if @doacao.save
        format.html { redirect_to @doacao, notice: 'Doacão Feita com sucesso.' }
        format.json { render :show, status: :created, location: @doacao }
      else
        format.html { render :new }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doacaos/1
  # PATCH/PUT /doacaos/1.json
  def update
    respond_to do |format|
      if @doacao.update(doacao_params)
        format.html { redirect_to @doacao, notice: 'Doacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @doacao }
      else
        format.html { render :edit }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doacaos/1
  # DELETE /doacaos/1.json
  def destroy
    @doacao.destroy
    respond_to do |format|
      format.html { redirect_to doacaos_url, notice: 'Doacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doacao
      @doacao = Doacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doacao_params
      params.require(:doacao).permit(:tipo, :local_doacao, :data_doacao, :horario_doacao, :user_id,
                                     :medicamentos_attributes => [:id, :nome, :tipo, :validade, :doacao_id])
    end

    def carrega_usuario
      @user = User.find(current_user.id)
    end
end
