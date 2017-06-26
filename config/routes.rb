Tauth::Engine.routes.draw do
  root :to => 'sessions#new'

  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :get
  match '/provider/callback', to: 'sessions#create', via: :post
  match '/failure', to: 'sessions#failure', via: :get
end
