Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'top#index'
  resources :tables do
    member do
      get 'clone'
    end
  end
  resources :works
  resources :taxons, only: [:show]
end
