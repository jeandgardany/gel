class PatrimoniesController < ApplicationController
  before_action :set_patrimony, only: [:show, :edit, :update, :destroy]

  # GET /patrimonies
  # GET /patrimonies.json
  def index
    @q = Patrimony.ransack(params[:q].try(:merge, m: params[:combinator]))
    @patrimonies = @q.result(distinct: true).includes(:movement).page(params[:page]).per(22).order('tag DESC')
    @pat = Patrimony.all
    @stocks = Stock.all
    @stock_movement = Movement.all
    @movements = Movement.all
    #@patrimonies = Patrimony.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "patrimonies",
        layout: 'pdf'
      end
    end
  end

  # GET /patrimonies/1
  # GET /patrimonies/1.json
  def show
  end

  # GET /patrimonies/new
  def new
    authorize @patrimony = Patrimony.new
  end

  # GET /patrimonies/1/edit
  def edit
  end

  # POST /patrimonies
  # POST /patrimonies.json
  def create
    @patrimony = Patrimony.new(patrimony_params)

    respond_to do |format|
      if @patrimony.save
        format.html { redirect_to @patrimony, notice: 'Patrimony was successfully created.' }
        format.json { render :show, status: :created, location: @patrimony }
      else
        format.html { render :new }
        format.json { render json: @patrimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patrimonies/1
  # PATCH/PUT /patrimonies/1.json
  def update
    respond_to do |format|
      if @patrimony.update(patrimony_params)
        format.html { redirect_to @patrimony, notice: 'Patrimony was successfully updated.' }
        format.json { render :show, status: :ok, location: @patrimony }
      else
        format.html { render :edit }
        format.json { render json: @patrimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrimonies/1
  # DELETE /patrimonies/1.json
  def destroy
    @patrimony.destroy
    respond_to do |format|
      format.html { redirect_to patrimonies_url, notice: 'Patrimony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrimony
      authorize @patrimony = Patrimony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patrimony_params
      params.require(:patrimony).permit(:tag, :movement_id, movement_attributes: [:action, :product_id, :amount, :shelfLife, :lifeCycle, :unitaryValue, :value, :data])
    end
end
