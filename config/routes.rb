Rails.application.routes.draw do
  root 'top#index'
  resources :tables
end
