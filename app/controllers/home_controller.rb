class HomeController < ApplicationController
  layout 'login'

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
    if session[:employee_id]
      check_day = DayType.all.where(date_created: Date.today.to_s).first
      if check_day.blank?
        day = DayType.new
        day.regular = true
        day.date_created = Date.today.to_s
        day.user_id = session[:employee_id]
        day.save
      end    
    else
      flash[:notice] = "Please Login"
      redirect_to home_login_path
    end
  end

  def clear_employee
    session[:employee_id] = nil
    redirect_to home_login_path
  end
end
