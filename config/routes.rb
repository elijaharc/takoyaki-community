# frozen_string_literal: true

Rails.application.routes.draw do
  resources :seller_pages, path: 'store' do
    resources :reviews
    resources :products
    get '/otp_verification' => 'seller_pages#verify'
  end
  resources :users, :only => [:update]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root 'home#index'
  get 'cities/:state', to: 'application#cities'
  get '/edit_profile' => 'home#edit_profile'
end
