class ExitsController < ApplicationController
  before_action :set_exit, only: [:show, :edit, :update, :destroy]

  # GET /exits
  # GET /exits.json
  def index
    @exits = Exit.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "exits",
        layout: 'pdf'
      end
    end
  end

  # GET /exits/1
  # GET /exits/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "exits",
        layout: 'pdf'
      end
    end
  end

  # GET /exits/new
  def new
    @exit = Exit.new
    @product_select = Product.all
    @stock_select = Stock.all
  end

  # GET /exits/1/edit
  def edit
    @stock_select = Stock.all
  end

  # POST /exits
  # POST /exits.json
  def create
    @exit = Exit.new(exit_params)

    respond_to do |format|
      if @exit.save
        format.html { redirect_to @exit, notice: 'Exit was successfully created.' }
        format.json { render :show, status: :created, location: @exit }
      else
        format.html { render :new }
        format.json { render json: @exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exits/1
  # PATCH/PUT /exits/1.json
  def update
    respond_to do |format|
      if @exit.update(exit_params)
        format.html { redirect_to @exit, notice: 'Exit was successfully updated.' }
        format.json { render :show, status: :ok, location: @exit }
      else
        format.html { render :edit }
        format.json { render json: @exit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exits/1
  # DELETE /exits/1.json
  def destroy
    @exit.destroy
    respond_to do |format|
      format.html { redirect_to exits_url, notice: 'Exit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit
      @exit = Exit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_params
      params.require(:exit).permit(:stock_id, :amount, :date, :comment)
    end
end
