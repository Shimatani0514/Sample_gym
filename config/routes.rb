Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/service'
  get 'static_pages/fee'
  get 'static_pages/staff'
  get 'static_pages/shop'
  get 'static_pages/contact'
  get 'static_pages/code'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "static_pages#home"
end
