Rails.application.routes.draw do
  mount TAuth::Engine => '/tauth'
end
