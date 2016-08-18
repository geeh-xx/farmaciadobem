class CarrinhosController < ApplicationController
  before_action :authenticate_user!
  include CurrentCart
  before_action :set_carrinho, only: [:show,:edit, :update, :destroy]


  # GET /carrinhos
  # GET /carrinhos.json
  def index
    @carrinhos = Carrinho.all
  end

  # GET /carrinhos/1
  # GET /carrinhos/1.json
  def show
    begin
      @carrinho = Carrinho.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Esta tentando acessar um carrinho invalido #{params[:id]}"
      redirect_to home_index_path, notice: "Carrinho invalido"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :show, status: :created, location: @carrinho }
      end
    end
  end

  # GET /carrinhos/new
  def new
    @carrinho = Carrinho.new
  end

  # GET /carrinhos/1/edit
  def edit
  end

  # POST /carrinhos
  # POST /carrinhos.json
  def create
    session[:carrinho_id] = nil
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Pedido realizado com sucesso.' }
      format.json { render :show, status: :created, location: home_index_path }
    end
  end

  # PATCH/PUT /carrinhos/1
  # PATCH/PUT /carrinhos/1.json
  def update
    respond_to do |format|
      if @carrinho.update(carrinho_params)
        format.html { redirect_to @carrinho, notice: 'Carrinho was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :edit }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrinhos/1
  # DELETE /carrinhos/1.json
  def destroy
    @carrinho = set_cart
    @carrinho.destroy
    session[:carrinho_id] = nil
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Cesta esvaziada com sucesso.' }
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrinho
      @carrinho = Carrinho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrinho_params
      params.require(:carrinho).permit(:data,:user_id)
    end
end
