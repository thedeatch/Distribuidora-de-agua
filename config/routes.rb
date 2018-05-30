Rails.application.routes.draw do


  get '/drivers', to: 'drivers#index', as: 'driver'
  get '/drivers/new', to: 'drivers#new'
  get '/drivers/:id', to: 'drivers#show'
  post '/drivers', to: 'drivers#create', as: 'create_driver'
  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  put '/drivers/:id', to: 'drivers#update'
  patch '/drivers/:id', to: 'drivers#update'
  delete '/drivers/:id', to: 'drivers#destroy', as: 'delete_driver'


  #get 'welcome/index'

  #root 'welcome#index'

  get '/clients', to: 'clients#index', as: 'client'
  get '/clients/new', to: 'clients#new'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create', as: 'create_client'
  get '/clients/:id/edit', to: 'clients#edit', as: 'edit_client'
  put '/clients/:id', to: 'clients#update'
  patch '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy', as: 'delete_client'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
