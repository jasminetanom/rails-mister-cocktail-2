class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses
  # GET /doses.json
  # def index
  #   @doses = Dose.all
  # end

  # GET /doses/1
  # GET /doses/1.json
  # def show
  # end

  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # GET /doses/1/edit
  # def edit
  # end

  # POST /doses
  # POST /doses.json
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail), notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  # def update
  #   respond_to do |format|
  #     if @dose.update(dose_params)
  #       format.html { redirect_to @dose, notice: 'Dose was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @dose }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @dose.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose = set_dose
    @dose.destroy
    @cocktail = @dose.cocktail
    respond_to do |format|
      format.html { redirect_to cocktail_path(@cocktail), notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
