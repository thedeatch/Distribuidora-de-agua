Rails.application.routes.draw do
  get 'static_pages/help'



  get '/drivers', to: 'drivers#index', as: 'driver'
  get '/drivers/new', to: 'drivers#new'
  get '/drivers/:id', to: 'drivers#show'
  post '/drivers', to: 'drivers#create', as: 'create_driver'
  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  put '/drivers/:id', to: 'drivers#update'
  patch '/drivers/:id', to: 'drivers#update'
  delete '/drivers/:id', to: 'drivers#destroy'


  #get 'welcome/index'

  #root 'welcome#index'

  root 'static_pages#home'
  get 'static_pages/home', as: 'home'

  get '/clients', to: 'clients#index', as: 'client'
  get '/clients/new', to: 'clients#new', as: 'new_client'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create', as: 'create_client'
  get '/clients/:id/edit', to: 'clients#edit', as: 'edit_client'
  put '/clients/:id', to: 'clients#update'
  patch '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy'

  resources :clients

  get '/orders', to: 'orders#index', as: 'order'
  get '/orders/new', to: 'orders#new', as: 'new_order'
  get '/orders/:id', to: 'orders#show'
  post '/orders', to: 'orders#create', as: 'create_order'
  get '/orders/:id/edit', to: 'orders#edit', as: 'edit_order'
  put '/orders/:id', to: 'orders#update'
  patch '/orders/:id', to: 'orders#update'
  delete '/orders/:id', to: 'orders#destroy'

  resources :orders

  get '/products', to: 'products#index', as: 'product'
  get '/products/new', to: 'products#new', as: 'new_product'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create', as: 'create_product'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  put '/products/:id', to: 'products#update'
  patch '/products/:id', to: 'products#update', as: 'update_product'
  delete '/products/:id', to: 'products#destroy'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
