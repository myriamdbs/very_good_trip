Rails.application.routes.draw do
  get 'item_shared/new'
  get 'members/new'
  get 'categories/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suitcases do
    resources :items, only: [:new, :create]
    resources :shared_items, only: [:new, :create]
    resources :interests, only: [:index]
    resources :suggestions, only: [:index, :create]
    resources :members, only: [:new, :create]
  end
  resources :items, only: [:destroy] do
    resource :tick, only: [:update]
  end
  resources :suggestions, only: [:destroy]
end
