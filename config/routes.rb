Rails.application.routes.draw do
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  get '/users/userhome', :to => "users#userhome"
  get '/users/:id/userroombooking', :to => "users#userroombooking", as: :users_userroombooking
  root 'users#managerdashboard'
end
