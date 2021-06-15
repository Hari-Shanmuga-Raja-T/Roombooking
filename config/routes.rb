Rails.application.routes.draw do
  resources :rooms
  root 'users#managerdashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
