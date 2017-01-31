Rails.application.routes.draw do
  resources :amounts
  devise_for :users

  resources :wikis

  get 'about' => 'welcome#about'

  root  'wikis#index'

  resources :collaborators
  resources :charges, only: [:new, :create, :destroy]
end
