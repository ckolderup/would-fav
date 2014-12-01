Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'
  get '/profile', to: 'sessions#show', as: 'show'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/user/:name', to: 'users#show', as: 'user'

  get '/collection/new', to: 'collections#new', as: 'new_collection'
  post '/collection', to: 'collections#create', as: 'create_collection'
  get '/collection/:slug(.:format)', to: 'collections#show', as: 'collection'
  delete '/collection/:slug', to: 'collections#destroy', as: 'destroy_collection'

  post '/tweets/create', to: 'tweets#create', as: 'create_tweet'
end
