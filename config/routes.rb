Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#index', as: :index

  post '/login'    => 'sessions#create', as: :session_create
  get '/start'    => 'sessions#start' , as: :sessions_start
  post '/logout' => 'sessions#logout', as: :sessions_logout
  delete '/logout' => 'sessions#logout'

  get '/admin/index' => 'admins#index', as: :admin_index
  get '/admin/check_in' => 'admins#check_in', as: :check_in
  post '/admin/check_out' => 'admins#check_out', as: :check_out
  get '/admin/manage_workers' => 'admins#manage_workers', as: :manage_workers
  get '/admin/manage_worker_records' => 'admins#manage_worker_records', as: :manage_worker_records
  get '/admin/create_employee' => 'users#create_employee', as: :users
  post '/admin/create_employee' => 'users#create', as: :create_employee_post
  
  get '/employee/index' => 'employees#index', as: :employee_index

  # Partial html render
  get '/admin/get_time' => 'admins#get_time'
  get '/admin/get_records' => 'admins#get_records'



end


=begin
Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'sessions#index', as: :index
post '/login' => 'sessions#create', as: :session_create
get '/show' => 'sessions#show'
delete '/logout' => 'sessions#destroy'

get 'show/:id/index' => 'users#index', as: :edit_user
post 'show/:id/index' => 'users#edit', as: :user
post 'show/new' => 'users#create', as: :users
get 'show/new' => 'users#new'
get 'show/show' => 'users#show'



get 'show/:id' => 'employees#show', as: :employee
get '/view' => 'employees#view', as: :view

resources :employees do
  collection do
    post :mark_checkin
    post :mark_checkout
  end
end

end

=end
