Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  root 'top#index'
  resources :tables do
    collection do
      get 'set_sample_data'
    end
    member do
      get 'clone'
    end
  end
  resources :works
  resources :taxons, only: [:show]
end
