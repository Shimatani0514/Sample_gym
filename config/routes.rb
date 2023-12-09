Rails.application.routes.draw do

  root 'static_pages#home'
  get "/home", to: 'static_pages#home'
  get "/service", to:'static_pages#service'
  get "/fee", to:'static_pages#fee'
  get "/staff", to:'static_pages#staff'
  get "/shop", to:'static_pages#shop'
  get "/contact", to:'static_pages#contact'

  get "/signup", to:'users#new'
  get "/users/:id", to: 'users#show'

  get "/login", to:'sessions#new'
  post "/login", to:'sessions#create'
  delete "/logout", to:'sessions#destroy'

  get "/reservations", to: 'reservations#index'
  get "/reservation/new", to: 'reservations#new'
  post "/reservation", to: 'reservations#create'
  get "/reservation/:id", to: 'reservations#show', as: 'reservation_show' # ルート名を変更
  delete "/reservation/:id", to: 'reservations#destroy', as: 'reservation_destroy'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users
  resources :reservations
end
