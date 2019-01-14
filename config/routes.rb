Rails.application.routes.draw do
  root 'home#login' 

  get 'home/login'
  get 'home/index'
  get 'home/home'
  get 'home/clear_employee'
  post 'home/validate_login'

  get 'admin', to: "dashboard#index"
  get 'login', to: "access#login"

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'dashboard/index'
  get 'css_sample/index'
  get 'css_sample/home'

  resources :deduction_details
  resources :deductions
  resources :salaries
  resources :leave_details
  resources :leaves
  resources :day_types
  resources :attendances
  resources :departments
  resources :admin_users
  resources :salary_types
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
