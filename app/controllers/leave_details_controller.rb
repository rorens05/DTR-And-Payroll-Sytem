class LeaveDetailsController < ApplicationController
  before_action :set_leave_detail, only: [:show, :edit, :update, :destroy]

  # GET /leave_details
  # GET /leave_details.json
  def index
    @leave_details = LeaveDetail.all
  end

  # GET /leave_details/1
  # GET /leave_details/1.json
  def show
  end

  # GET /leave_details/new
  def new
    @leave_detail = LeaveDetail.new
  end

  # GET /leave_details/1/edit
  def edit
  end

  # POST /leave_details
  # POST /leave_details.json
  def create
    @leave_detail = LeaveDetail.new(leave_detail_params)

    respond_to do |format|
      if @leave_detail.save
        format.html { redirect_to @leave_detail, notice: 'Leave detail was successfully created.' }
        format.json { render :show, status: :created, location: @leave_detail }
      else
        format.html { render :new }
        format.json { render json: @leave_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_details/1
  # PATCH/PUT /leave_details/1.json
  def update
    respond_to do |format|
      if @leave_detail.update(leave_detail_params)
        format.html { redirect_to @leave_detail, notice: 'Leave detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_detail }
      else
        format.html { render :edit }
        format.json { render json: @leave_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_details/1
  # DELETE /leave_details/1.json
  def destroy
    @leave_detail.destroy
    respond_to do |format|
      format.html { redirect_to leave_details_url, notice: 'Leave detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_detail
      @leave_detail = LeaveDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_detail_params
      params.require(:leave_detail).permit(:name, :is_payed, :number_of_days)
    end
end
