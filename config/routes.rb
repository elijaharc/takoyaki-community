# frozen_string_literal: true

Rails.application.routes.draw do
  resources :seller_pages

  # resources :broker_stocks, only: [:create, :destroy, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'
  get 'cities/:state', to: 'application#cities'
end
