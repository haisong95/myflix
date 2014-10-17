Myflix::Application.routes.draw do
  get "user/new"
  get "pages/front"
  root to: "pages#front"
  resources :videos, only: [:show] do
    collection do
      post :search, to: "videos#search"
    end
  end
  get 'ui(/:action)', controller: 'ui'
  get 'register', to: "users#new"
  resources :users, only: [:create]
end