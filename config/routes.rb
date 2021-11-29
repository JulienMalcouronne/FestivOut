Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/friends", to: "friends#index"
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  get "/map", to: "pages#map"
  resources :friends, only: [:new, :create, :index] do
    member do
      post :confirm
      post :refuse
    end
  end
  resources :reminders, only: [:index, :create, :new]
  resources :localize_users, only: [:update]
  resources :festivals do
    resources :days, only: [:new, :create, :show, :index] do
      resources :artists, only: [:new, :create]
    end
    resources :point_of_interests, only: [:index, :show]
    resources :chatrooms, only: [:show, :index] do
      resources :messages, only: :create
    end
    resources :shops, only: [:new, :create, :show, :index] do
      resources :items, only: [:new, :create]
    end
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
