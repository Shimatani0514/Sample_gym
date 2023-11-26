Rails.application.routes.draw do

  root 'static_pages#home'
  get "/home", to: 'static_pages#home'
  get "/service", to:'static_pages#service'
  get "/fee", to:'static_pages#fee'
  get "/staff", to:'static_pages#staff'
  get "/shop", to:'static_pages#shop'
  get "/contact", to:'static_pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
