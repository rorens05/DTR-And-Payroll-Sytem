class HomeController < ApplicationController
  layout 'login'
  before_action :check_user, except: [:login, :validate_login, :clear_employee]

  def login

  end

  def index

  end

  def validate_login
    
    if params[:rfid]
      found_employee = Employee.all.where(rfid_code: params[:rfid]).first
      if found_employee
        session[:employee_id] = found_employee.id
        redirect_to home_home_path
      else
        flash[:notice] = "Invalid Employee"
        redirect_to home_login_path
      end
    end
  end

  def home
    @employees = Employee.all
    @attendance_today = Attendance.all.where(day_type: DayType.all.last)
    @regular_time_in = Time.new().change(year: 2000, month: 1, day: 1, hour: 8, min: 0, sec: 0)
    
    @late_employees = 0    
    @attendance_today.each do |attendance|
      if attendance.time_in > @regular_time_in
        @late_employees = @late_employees + 1
      end
    end

    @employee_name = Employee.find(session[:employee_id]).name
    check_day = DayType.all.where(date_created: Date.today.to_s).first
    if check_day.blank?
      day = DayType.new
      day.regular = true
      day.date_created = Date.today.to_s
      day.user_id = session[:employee_id]
      day.save
    end
  end

  def time_in_user()

    @employees = Employee.all
    

    found_employee = get_employee_by_rfid
    @time_now = Time.now().change(year: 2000, month: 1, day: 1)

    if found_employee
      @employee = found_employee  
      
      @day_type = get_day_type
      attendance = Attendance.all.where(day_type: @day_type.id, employee_id: @employee.id).first
      
      if attendance.blank? # if employee has time in today
        time_in_employee # then time in
      else        
        # check if he does not have time out then
        if attendance.time_out.present?          
          flash.now[:notice] = "You already timed out" # notify him
        else # if he has no time out
          check_times = attendance.time_in + 60 * 60
          if @time_now < check_times  # if he timed in less than 1 hour ago
            flash.now[:notice] = "Your too early to time out"
          else
            attendance.time_out = Time.now
            if attendance.validate
              attendance.save
              flash.now[:notice] = "Goodbye"
            end
          end
        # check if he/she has already timein 1 hour ago

        end

      end   

      @attendance_today = Attendance.all.where(day_type: DayType.all.last)
      @regular_time_in = Time.new().change(year: 2000, month: 1, day: 1, hour: 8, min: 0, sec: 0)
      
      @late_employees = 0    
      @attendance_today.each do |attendance|
        if attendance.time_in > @regular_time_in
          @late_employees = @late_employees + 1
        end
      end

      render 'home'
    else
      flash[:notice] = "Invalid RFID, Contact Admin"
      redirect_to home_home_path
    end
  end

  def clear_employee
    session[:employee_id] = nil
    redirect_to home_login_path
  end

  private
  def get_employee_by_rfid()
    if params[:rfid]
      employee = Employee.all.where(rfid_code: params[:rfid]).first
    else      
      flash[:notice] = "Invalid request"
      redirect_to home_home_path      
    end
  end

  def check_user()
    if session[:employee_id].blank?
      flash[:notice] = "Please Login"
      redirect_to home_login_path
    end
  end

  def get_day_type()
    DayType.all.where(date_created: Date.today).first
  end

  def time_in_employee
    e_attendance = Attendance.new
    e_attendance.time_in = Time.now
    e_attendance.employee_id = @employee.id
    e_attendance.day_type = @day_type.id
    e_attendance.save
    flash.now[:notice] = "You have successfully timed in"
  end
end
