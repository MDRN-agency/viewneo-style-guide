Rails.application.routes.draw do
  root 'pages#index'
  resources :listings, only: [:index, :show]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'users', to: 'users#index'

  namespace :admin do
    resources :listings
    resources :brands
    resources :companies
    resources :deals
  end

  resource :profile, controller: :profile, only: [:show, :edit, :update]
end
