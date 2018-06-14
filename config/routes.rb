Rails.application.routes.draw do


  devise_for :users
  get "help", to: 'static_pages#help'

  resources :clients
  resources :drivers
  resources :products
  resources :orders
  resources :trucks 
  resources :driver_trucks

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
