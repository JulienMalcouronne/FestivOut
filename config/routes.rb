Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/friends", to: "pages#friends"
  get "/map",to: "pages#map"
  resources :friends, only: [:new, :create, :index]
  resources :festivals do
    # member do
      resources :shops, only: [:new, :create, :show, :index] do
        # member do
          resources :items, only: [:new, :create]
        end
      end
    end
  # end
# end
