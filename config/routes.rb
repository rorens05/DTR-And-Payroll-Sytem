Rails.application.routes.draw do
  get 'admin', to: "dashboard#index"
  get 'login', to: "access#login"

  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  get 'dashboard/index'
  get 'css_sample/index'
  get 'css_sample/home'
  root 'css_sample#index'

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
