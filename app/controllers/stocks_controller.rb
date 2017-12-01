class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :show_pdf, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    #@movements = Movement.all
    @q = Stock.ransack(params[:q].try(:merge, m: params[:combinator]))
    @stocks = @q.result(distinct: true).includes(:movement).page(params[:page]).per(19)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks/index_pdf",
        layout: 'pdf'
      end
    end
  end

def index_pdf
  @stocks = Stock.all
  @movements = Movement.all
  respond_to do |format|
    format.pdf do
      render pdf: "stocks/index_pdf",
      layout: 'pdf'
    end
  end
end
# GET /stock/laboratory
def laboratory1
    #@movements = Movement.all
    @q = Stock.ransack(params[:q].try(:merge, m: params[:combinator]))
    @stocks = @q.result(distinct: true).includes(:movement).page(params[:page]).per(19)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks/laboratory1_pdf",
        layout: 'pdf'
      end
    end
  end

  def laboratory2
    #@movements = Movement.all
    @q = Stock.ransack(params[:q].try(:merge, m: params[:combinator]))
    @stocks = @q.result(distinct: true).includes(:movement).page(params[:page]).per(19)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks/laboratory2_pdf",
        layout: 'pdf'
      end
    end
  end

  def laboratory3
    #@movements = Movement.all
    @q = Stock.ransack(params[:q].try(:merge, m: params[:combinator]))
    @stocks = @q.result(distinct: true).includes(:movement).page(params[:page]).per(19)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "stocks/laboratory3_pdf",
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
    @stocks = Stock.all
    @movements = Movement.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "show",
        layout: 'pdf'
      end
    end
  end

  #GET /stocks/input
  def input
    @stock = Stock.new
    @stock.build_movement
    @patrimonies = Patrimony.all
    @product_select = Product.all
    @laboratories = Laboratory.all
    @movement_select = Movement.all
    @patrimonies = Patrimony.all
    @employee_select = Employee.all
    @stocks = Stock.search(params[:query])
    respond_to do |format|
      format.html
    end

  end

  #GET /stocks/exit
  def exit
    @stock = Stock.new
    @stock.build_movement
    @patrimonies = Patrimony.all
    @product_select = Product.all
    @laboratories = Laboratory.all
    @movement_select = Movement.all
    @patrimonies = Patrimony.all
    @employee_select = Employee.all
    @stocks = Stock.search(params[:query])
    respond_to do |format|
      format.html
    end

  end

  # GET /stocks/new
  def new 
    @stock = Stock.new
    @stock.build_movement
    @stock.build_solicitation
    @stocks = Stock.all
    @patrimonies = Patrimony.all
    @product_select = Product.all
    @laboratories = Laboratory.all
    @movement_select = Movement.all
    @patrimonies = Patrimony.all
    @employee_select = Employee.all
    @stocks = Stock.search(params[:query])
    respond_to do |format|
      format.html
    end

  end

  # GET /stocks/1/edit
  def edit
    @laboratories = Laboratory.all
    @movement_select = Movement.all
    @product_select = Product.all
    @patrimonies = Patrimony.all
    @employee_select = Employee.all
    @solicitations = Solicitation.all
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
      authorize @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:laboratory_id, movement_attributes: [:id, :action, :product_id, :amount, :shelfLife, :lifeCycle, :unitaryValue, :value, :data, patrimonies_attributes: [:id, :tag, :_destroy], solicitation_attributes: [:id, :description, :employee_id, :_destroy, employee_attibutes:[:id, :code, :name, :_destroy, office_attributes: [:id, :name]]]])
    end
end
