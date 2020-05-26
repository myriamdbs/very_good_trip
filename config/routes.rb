Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  get 'items/destroy'
  get 'items/pack'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suitcases, only: [:index, :new, :show, :create]
end
