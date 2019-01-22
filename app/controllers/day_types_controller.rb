class DayTypesController < ApplicationController
  before_action :set_day_type, only: [:show, :edit, :update, :destroy]

  # GET /day_types
  # GET /day_types.json
  def index
    @day_types = DayType.all
  end

  # GET /day_types/1
  # GET /day_types/1.json
  def show
  end

  # GET /day_types/new
  def new
    @day_type = DayType.new
  end

  # GET /day_types/1/edit
  def edit
  end

  # POST /day_types
  # POST /day_types.json
  def create
    @day_type = DayType.new(day_type_params)

    respond_to do |format|
      if @day_type.save
        format.html { redirect_to @day_type, notice: 'Day type was successfully created.' }
        format.json { render :show, status: :created, location: @day_type }
      else
        format.html { render :new }
        format.json { render json: @day_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_types/1
  # PATCH/PUT /day_types/1.json
  def update
    respond_to do |format|
      if @day_type.update(day_type_params)
        format.html { redirect_to @day_type, notice: 'Day type was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_type }
      else
        format.html { render :edit }
        format.json { render json: @day_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_types/1
  # DELETE /day_types/1.json
  def destroy
    
    attendance = Attendance.all.where(day_type: @day_type.id)
    attendance.each do |a|
      a.destroy
    end

    @day_type.destroy
    respond_to do |format|
      format.html { redirect_to day_types_url, notice: 'Day type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_type
      @day_type = DayType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_type_params
      params.require(:day_type).permit(:regular, :date_created, :user_id)
    end
end
