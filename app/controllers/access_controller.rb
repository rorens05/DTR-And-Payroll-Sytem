class AccessController < ApplicationController
  
  before_action :check_login, except: [:logout]

  layout 'login'

  def login
  end

  def attempt_login
    if params[:password].present? and params[:email].present?
      found_user = AdminUser.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end      
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to dashboard_index_path 
    else
      flash.now[:notice] = "Invalid email and password combination."
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to access_login_path
  end

  private
  def check_login
    if session[:user_id].present?
      redirect_to dashboard_index_path
    end
  end
end
