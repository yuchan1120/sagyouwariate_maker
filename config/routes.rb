Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'top#index'
  resources :tables
  resources :works
end
