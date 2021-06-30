Rails.application.routes.draw do
  use_doorkeeper# do
    #skip_controllers :authorizations, :applications, :authorized_applications
  #end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'users/showlog/:id', :to => "users#showlog" 
      resources :users
      resources :rooms
      resources :logs
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/users/booking', :to => "logs#create"
  post '/users/roomsearch', :to => 'users#roomsearch'
  get 'users/history' , :to => "users#userhistory" , as: :users_history
  get 'hotels/history' , :to => "hotels#hotel_history" , as: :hotel_history
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  get '/users/userhome', :to => "users#userhome"
  get '/users/:id/userroombooking', :to => "users#userroombooking", as: :users_userroombooking
  root 'users#managerdashboard'
end
