class MovementsController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]

  # GET /movements
  # GET /movements.json
  def index
    @q = Movement.ransack(params[:q].try(:merge, m: params[:combinator]))
    @movements = @q.result(distinct: true)
    #@movements = Movement.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "movements",
        layout: 'pdf'
      end
    end
  end

  def inputs
    @movements = Movement.inputs.order(product_id: :asc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "inputs",
        layout: 'pdf'
      end
    end
  end

  def exits
    @movements = Movement.exits.order(product_id: :asc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "exits",
        layout: 'pdf'
      end
    end
  end

  def currentInventory
    @movements = Movement.all
    @movInputs = Movement.inputs
    @movExits = Movement.exits
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "currentInventory",
        layout: 'pdf'
      end
    end
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
    @q = Movement.ransack(params[:q].try(:merge, m: params[:combinator]))
    @movements = @q.result(distinct: true)
    #@movements = Movement.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "movements",
        layout: 'pdf'
      end
    end
  end

  # GET /movements/new
  def new
    authorize @movement = Movement.new
    @movement.build_solicitation
    @patrimonies = Patrimony.all
    @solicitations = Solicitation.all
    @employee_select = Employee.all
    @product_select = Product.all

  end

  # GET /movements/1/edit
  def edit
    @product_select = Product.all
    @employee_select = Employee.all
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1
  # PATCH/PUT /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to @movement, notice: 'Movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.json
  def destroy
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      authorize @movement = Movement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_params
      params.require(:movement).permit(:action, :product_id, :amount, :shelfLife, :lifeCycle, :unitaryValue, :value, :data, :stock_id, patrimonies_attributes: [:id, :tag, :_destroy], solicitation_attributes: [:id, :description, :employee_id, :_destroy, employee_attibutes:[:id, :code, :name, :_destroy, office_attributes: [:id, :name]]])
    end
end
