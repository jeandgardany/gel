class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    #@movements = Movement.all
    @q = Stock.ransack(params[:q].try(:merge, m: params[:combinator]))
    @stocks = @q.result(distinct: true).includes(:movement).page(params[:page]).per(18)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks",
        layout: 'pdf'
      end
    end
  end
  #GET /stocks/entrada
  def entrada
   @stocks = Stock.all
  end

  def buscar
    @laboratory_select = Laboratory.all
  end

  def resultado
    @stocks = Stock.search(params[:query])
    #respond_with @products
    respond_to do |format|
      format.html
    end
    
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks",
        layout: 'pdf'
      end
    end
  end

  # GET /stocks/new
  def new 
    @stock = Stock.new
    @stock.build_movement
    @product_select = Product.all
    @laboratory_select = Laboratory.all
    @movement_select = Movement.all
    @stocks = Stock.search(params[:query])
    respond_to do |format|
      format.html
    end

  end

  # GET /stocks/1/edit
  def edit
    @laboratory_select = Laboratory.all
    @movement_select = Movement.all
    @product_select = Product.all
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:laboratory_id, movement_attributes: [:action, :product_id, :amount, :shelfLife, :lifeCycle, :unitaryValue, :value, :data])
    end
end
