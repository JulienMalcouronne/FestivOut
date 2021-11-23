Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/friends", to: "pages#friends"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :friends, only: [:new, :create, :index]
  resources :festivals do
    member do
      resources :shops, only: [:new, :create, :show, :index] do
        member do
          resources :items, only: [:new, :create, :show, :index]
        end
      end
    end
  end
end
