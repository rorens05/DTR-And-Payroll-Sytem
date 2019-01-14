class DeductionDetailsController < ApplicationController
  before_action :set_deduction_detail, only: [:show, :edit, :update, :destroy]

  # GET /deduction_details
  # GET /deduction_details.json
  def index
    @deduction_details = DeductionDetail.all
  end

  # GET /deduction_details/1
  # GET /deduction_details/1.json
  def show
  end

  # GET /deduction_details/new
  def new
    @deduction_detail = DeductionDetail.new
  end

  # GET /deduction_details/1/edit
  def edit
  end

  # POST /deduction_details
  # POST /deduction_details.json
  def create
    @deduction_detail = DeductionDetail.new(deduction_detail_params)

    respond_to do |format|
      if @deduction_detail.save
        format.html { redirect_to @deduction_detail, notice: 'Deduction detail was successfully created.' }
        format.json { render :show, status: :created, location: @deduction_detail }
      else
        format.html { render :new }
        format.json { render json: @deduction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deduction_details/1
  # PATCH/PUT /deduction_details/1.json
  def update
    respond_to do |format|
      if @deduction_detail.update(deduction_detail_params)
        format.html { redirect_to @deduction_detail, notice: 'Deduction detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @deduction_detail }
      else
        format.html { render :edit }
        format.json { render json: @deduction_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deduction_details/1
  # DELETE /deduction_details/1.json
  def destroy
    @deduction_detail.destroy
    respond_to do |format|
      format.html { redirect_to deduction_details_url, notice: 'Deduction detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deduction_detail
      @deduction_detail = DeductionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deduction_detail_params
      params.require(:deduction_detail).permit(:name, :percentage, :fixed_deduction)
    end
end
