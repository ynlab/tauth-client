Tauth::Engine.routes.draw do
  root :to => 'sessions#new'

  match '/login'             => 'sessions#new'
  match '/logout'            => 'sessions#destroy'
  match '/provider/callback' => 'sessions#create'
  match '/failure'           => 'sessions#failure'
end
