Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#index', as: :index

  post '/login'    => 'sessions#create', as: :session_create
  get '/start'    => 'sessions#start' , as: :sessions_start
  post '/logout' => 'sessions#logout', as: :sessions_logout
  delete '/logout' => 'sessions#logout'

  get '/admin/index' => 'admins#index', as: :admin_index
  post '/admin/check_in' => 'admins#check_in', as: :check_in
  post '/admin/check_out' => 'admins#check_out', as: :check_out

  #resources :admins do
  #  collection do
  #    post :check_in
  #    post :check_out
  #  end
  #end

  # Partial html render
  #get '/admin/get_time' => 'admins#get_time'
  #get '/admin/get_button_or_record' => 'admins#get_button_or_record'



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
