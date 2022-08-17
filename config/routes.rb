Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
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
  get 'search_table' => 'tables#search'
  get 'search_work' => 'works#search'
  post '/top/guest_sign_in', to: 'top#guest_sign_in'
end
