Rails.application.routes.draw do
  get 'static_pages/help'

  #get 'welcome/index'

  #root 'welcome#index'

  root 'static_pages#home'
  get 'static_pages/home'

  get '/clients', to: 'clients#index', as: 'client'
  get '/clients/new', to: 'clients#new', as: 'new_client'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create', as: 'create_client'
  get '/clients/:id/edit', to: 'clients#edit', as: 'edit_client'
  put '/clients/:id', to: 'clients#update'
  patch '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy'

  resources :clients

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
