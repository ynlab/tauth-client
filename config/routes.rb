Tauth::Engine.routes.draw do
  match '/provider/callback', :to => 'sessions#create'
  match '/provider/failure',  :to => 'sessions#failure'
end
