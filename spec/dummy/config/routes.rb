Rails.application.routes.draw do
  root :to => 'main#index'

  mount Tauth::Engine => '/auth', :as => 'tauth'
end
