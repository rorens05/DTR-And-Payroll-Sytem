class ApplicationController < ActionController::Base

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :validate_login, :home, :clear_employee,:time_in_user]
 
  private
  
  def confirm_logged_in
    @admin_name = "invalid user"
    if session[:user_id].present?
      @admin_name = AdminUser.find(session[:user_id]).name
    else
      redirect_to access_login_path
    end
  end
end
