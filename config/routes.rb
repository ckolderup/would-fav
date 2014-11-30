Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'
  get '/profile', to: 'sessions#show', as: 'show'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/user/:name', to: 'users#show', as: 'user'
  get '/collection/:slug', to: 'collections#show', as: 'collection'
end
