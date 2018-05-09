Rails.application.routes.draw do
  #get 'welcome/index'

  #root 'welcome#index'

  get '/clients', to: 'clients#index', as: 'client'
  get '/clients/new', to: 'clients#new'
  get '/clients/:id', to: 'clients#show'
  post '/clients', to: 'clients#create', as: 'create_client'
  get '/clients/:id/edit', to: 'clients#edit', as: 'edit_client'
  put '/clients/:id', to: 'clients#update'
  patch '/clients/:id', to: 'clients#update'
  delete '/clients/:id', to: 'clients#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
