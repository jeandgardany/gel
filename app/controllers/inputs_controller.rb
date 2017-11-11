class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]

  # GET /inputs
  # GET /inputs.json
  def index
    @inputs = Input.all
  end

  # GET /inputs/1
  # GET /inputs/1.json
  def show
  end

  # GET /inputs/new
  def new
    @input = Input.new
    @product_select = Product.all
    @stock_select = Stock.all
    @laboratory_select = Laboratory.all
    #@laboratory = Laboratory.find(params[:id])
  end

  # GET /inputs/1/edit
  def edit
    @product_select = Product.all
    @laboratory_select = Laboratory.all

  end

  # POST /inputs
  # POST /inputs.json
  def create
    @input = Input.new(input_params)

    respond_to do |format|
      if @input.save
        format.html { redirect_to @input, notice: 'Input was successfully created.' }
        format.json { render :show, status: :created, location: @input }
      else
        format.html { render :new }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inputs/1
  # PATCH/PUT /inputs/1.json
  def update
    respond_to do |format|
      if @input.update(input_params)
        format.html { redirect_to @input, notice: 'Input was successfully updated.' }
        format.json { render :show, status: :ok, location: @input }
      else
        format.html { render :edit }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inputs/1
  # DELETE /inputs/1.json
  def destroy
    @input.destroy
    respond_to do |format|
      format.html { redirect_to inputs_url, notice: 'Input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def input_selects
          @input_laboratory = InputLaboratory.where(laboratory_id: current_laboratory.id)
          #@atendment_region = AtendmentRegion.where(status: true, user_id: current_user.id)
          #@atendment_assoc = AtendmentRegionAssoc.where(status: true, assoc_id: current_user.entidade_id).where(atendment_region_id: @atendment_region.map(&:atendment_region_id))
          #@solutions = Atendment.joins(:solution).where("atendment_area_id = ? and atendment_region_id = ? and atendment_assoc_id = ?", params[:atendment_area_id], params[:atendment_region_id], params[:atendment_region_assoc_id])
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_input
      @input = Input.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def input_params
      params.require(:input).permit(:laboratory_id, :product_id, :shelfLife, :lifeCycle, :amount, :unitaryValue, :value, :date)
    end
end
