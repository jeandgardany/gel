class SolicitationsController < ApplicationController
  before_action :set_solicitation, only: [:show, :edit, :update, :destroy]

  # GET /solicitations
  # GET /solicitations.json
  def index
    @solicitations = Solicitation.all.order(id: :desc)
  end

  # GET /solicitations/1
  # GET /solicitations/1.json
  def show
  end

  # GET /solicitations/new
  def new
    @solicitation = Solicitation.new
    @employee_select = Employee.all
  end

  # GET /solicitations/1/edit
  def edit
     @employee_select = Employee.all
  end

  # POST /solicitations
  # POST /solicitations.json
  def create
    @solicitation = Solicitation.new(solicitation_params)

    respond_to do |format|
      if @solicitation.save
        format.html { redirect_to @solicitation, notice: 'Solicitation was successfully created.' }
        format.json { render :show, status: :created, location: @solicitation }
      else
        format.html { render :new }
        format.json { render json: @solicitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitations/1
  # PATCH/PUT /solicitations/1.json
  def update
    respond_to do |format|
      if @solicitation.update(solicitation_params)
        format.html { redirect_to @solicitation, notice: 'Solicitation was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitation }
      else
        format.html { render :edit }
        format.json { render json: @solicitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitations/1
  # DELETE /solicitations/1.json
  def destroy
    @solicitation.destroy
    respond_to do |format|
      format.html { redirect_to solicitations_url, notice: 'Solicitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitation
      @solicitation = Solicitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitation_params
      params.require(:solicitation).permit(:employee_id, :description, :movement_id)
    end
end
