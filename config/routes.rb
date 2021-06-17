Rails.application.routes.draw do
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  root 'users#managerdashboard'
end
