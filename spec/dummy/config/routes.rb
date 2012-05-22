Rails.application.routes.draw do
  root :to => 'main#index'

  get '/private' => 'main#private'

  mount Tauth::Engine => '/auth', :as => 'tauth'
end
