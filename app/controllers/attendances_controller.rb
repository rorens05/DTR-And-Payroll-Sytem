class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]


  # GET /attendances
  # GET /attendances.json
  def index
    @day_types = DayType.sorted

    if params[:day_id] 
      @attendances = Attendance.attendance_by_date(params[:day_id])
      @day_id = params[:day_id].to_i
    else
      @day_id = @day_types.first.id
      @attendances = Attendance.attendance_by_date(@day_id)
    end

    
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @employees = Employee.all
    @day_types = DayType.sorted
  end

  # GET /attendances/1/edit
  def edit
    @employees = Employee.all
    @day_types = DayType.all
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    found_attendance = Attendance.all.where(day_type: @attendance.day_type, employee: @attendance.employee)
    if found_attendance.present?
      redirect_to new_attendance_path 
      flash[:notice] = 'User already has attendance'
    else
      respond_to do |format|
        if @attendance.save
          format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
          format.json { render :show, status: :created, location: @attendance }
        else
          format.html { render :new }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end      
    end

    
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:time_in, :time_out, :employee_id, :day_type)
    end
end
