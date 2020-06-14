require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount Sidekiq::Web => '/sidekiq'

  namespace :admin do
    resources :events, only: [:index, :new, :create]
    resources :points, only: [:index]
    resources :drivers, only: [:index, :new, :create]
    resources :trips, only: [:index, :new, :create]
  end

  namespace :driver do
  end

  namespace :api do
    resources :drivers, only: [:create]
    resources :trips, only: [:create]
  end
end
