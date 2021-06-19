Rails.application.routes.draw do
  post '/users/booking', :to => "logs#create"
  get 'users/history' , :to => "users#userhistory" , as: :users_history
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  get '/users/userhome', :to => "users#userhome"
  get '/users/:id/userroombooking', :to => "users#userroombooking", as: :users_userroombooking
  root 'users#managerdashboard'
end
