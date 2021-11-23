Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/friends", to: "pages#friends"
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
