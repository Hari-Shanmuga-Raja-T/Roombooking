Rails.application.routes.draw do
  use_doorkeeper
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
  post '/users/roomsearch', :to => 'users#roomsearch', as: :users_roomsearch
  get 'users/history' , :to => "users#userhistory" , as: :users_history
  get 'hotels/history' , :to => "hotels#hotel_history" , as: :hotel_history
  get 'hotels/discount', :to => "hotels#add_discount" , as: :hotel_discount
  get 'users/roomsearch', :to => 'users#userhome'
  post 'discounts/edit', :to => "discounts#edit"
  post 'bookings/create', :to => "bookings#create"
  post 'bookings/delete', :to => "bookings#delete"
  post '/wishlists/create', :to => "wishlists#create" , as: :wishlist_create
  post '/wishlists/delete', :to => "wishlists#delete" , as: :wishlist_delete
  get 'users/bookings', :to => "users#booking_list", as: :users_bookings
  get 'hotels/bookings', :to => "hotels#booking_list", as: :hotels_bookings
  get 'users/wishlists', :to => "users#wish_list", as: :users_wishlist
  devise_for :users , path: 'users'
  devise_for :hotels
  resources :rooms
  get '/users/userhome', :to => "users#userhome"
  get '/users/:id/userroombooking', :to => "users#userroombooking", as: :users_userroombooking
  root 'users#managerdashboard'
end
