Rails.application.routes.draw do


  devise_for :users, :path_prefix => 'us'
  get "help", to: 'static_pages#help' 

  #Rails.application.routes.draw do
    #devise_for :users, controllers: {
      #sessions: 'users/sessions', 
      #registrations: 'users/registrations'    
  #}
  #end

  namespace :charts do  
    get "new-clients" 
    get "new-orders" 
    get "income-orders"
  end

  resources :users
  resources :clients
  resources :drivers
  resources :products
  resources :orders
  resources :trucks 
  resources :drivers_trucks

  root 'static_pages#home'
  
  get :search, controller: :main 
  root to: "main#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
