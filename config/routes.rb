Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/friends", to: "pages#friends"
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  get "/map",to: "pages#map"
  resources :friends, only: [:new, :create, :index]
  resources :festivals do
    resources :shops, only: [:new, :create, :show, :index] do
      resources :items, only: [:new, :create]
    end
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
