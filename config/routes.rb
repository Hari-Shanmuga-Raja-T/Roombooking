Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
      resources :rooms
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/users/booking', :to => "logs#create"
  post '/users/roomsearch', :to => 'users#roomsearch'
  get 'users/history' , :to => "users#userhistory" , as: :users_history
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  get '/users/userhome', :to => "users#userhome"
  get '/users/:id/userroombooking', :to => "users#userroombooking", as: :users_userroombooking
  root 'users#managerdashboard'
end
