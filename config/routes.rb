Tauth::Engine.routes.draw do
  match '/provider/callback' => 'sessions#create'
  match '/provider/failure'  => 'sessions#failure'

  match '/logout' => 'sessions#destroy'
end
