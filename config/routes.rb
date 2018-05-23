Rails.application.routes.draw do
  get 'static_pages/help'

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
