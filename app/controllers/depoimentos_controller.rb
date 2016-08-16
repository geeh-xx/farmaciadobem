class DepoimentosController < ApplicationController
  before_action :set_depoimento, only: [:show, :edit, :update, :destroy]
  before_action :carrega_usuario

  # GET /depoimentos
  # GET /depoimentos.json
  def index
    @depoimentos = @user.depoimentos.all.reverse_order
  end

  # GET /depoimentos/1
  # GET /depoimentos/1.json
  def show
  end

  # GET /depoimentos/new
  def new
    @depoimento = Depoimento.new
  end

  # GET /depoimentos/1/edit
  def edit
  end

  # POST /depoimentos
  # POST /depoimentos.json
  def create
    @depoimento = Depoimento.new(depoimento_params)

    respond_to do |format|
      if @depoimento.save
        format.html { redirect_to @depoimento, notice: 'Depoimento was successfully created.' }
        format.json { render :show, status: :created, location: @depoimento }
      else
        format.html { render :new }
        format.json { render json: @depoimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depoimentos/1
  # PATCH/PUT /depoimentos/1.json
  def update
    respond_to do |format|
      if @depoimento.update(depoimento_params)
        format.html { redirect_to @depoimento, notice: 'Depoimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @depoimento }
      else
        format.html { render :edit }
        format.json { render json: @depoimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depoimentos/1
  # DELETE /depoimentos/1.json
  def destroy
    @depoimento.destroy
    respond_to do |format|
      format.html { redirect_to depoimentos_url, notice: 'Depoimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depoimento
      @depoimento = Depoimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depoimento_params
      params.require(:depoimento).permit(:depoimento, :user_id)
    end

    def carrega_usuario
      @user = User.find(current_user.id)
    end

end
