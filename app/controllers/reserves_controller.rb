class ReservesController < ApplicationController
  before_action :set_reserve, only: [:show, :edit, :update, :destroy]

  # GET /reserves
  # GET /reserves.json
  def index
    #@reserves = Reserve.all
    @q = Reserve.ransack(params[:q].try(:merge, m: params[:combinator]))
    @reserves = @q.result(distinct: true).page(params[:page]).per(8).order(id: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "reserves",
        layout: 'pdf'
      end
    end
  end

  # GET /reserves/1
  # GET /reserves/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "reserves",
        layout: 'pdf'
      end
    end
  end

  def solicitations
    @reserves = Reserve.all.order(id: :desc)
    @quantities = Quantity.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "reserves",
        layout: 'pdf'
      end
    end
  end

  # GET /reserves/new
  def new
    @reserve = Reserve.new
    @employee_select = Employee.all
    @laboratory_select = Laboratory.all
    @products = Product.all
    @quantities = Quantity.all
  end

  # GET /reserves/1/edit
  def edit
    @employee_select = Employee.all
    @laboratory_select = Laboratory.all
    @products = Product.all
    @quantities = Quantity.all
  end

  # POST /reserves
  # POST /reserves.json
  def create
    @reserve = Reserve.new(reserve_params)

    respond_to do |format|
      if @reserve.save
        format.html { redirect_to @reserve, notice: 'Reserve was successfully created.' }
        format.json { render :show, status: :created, location: @reserve }
      else
        format.html { render :new }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserves/1
  # PATCH/PUT /reserves/1.json
  def update
    respond_to do |format|
      if @reserve.update(reserve_params)
        format.html { redirect_to @reserve, notice: 'Reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserve }
      else
        format.html { render :edit }
        format.json { render json: @reserve.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserves/1
  # DELETE /reserves/1.json
  def destroy
    @reserve.destroy
    respond_to do |format|
      format.html { redirect_to reserves_url, notice: 'Reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserve
      authorize @reserve = Reserve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserve_params
      params.require(:reserve).permit(:id, :description, :shift, :start_time, :end_time, :employee_id, :laboratory_id, quantities_attributes: [:id, :product_id, :amount, :_destroy, products_attributes: [:id, :code, :name, :category_id, :description, :provider]])
    end
end
