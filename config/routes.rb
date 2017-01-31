Rails.application.routes.draw do
  resources :amounts
  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'
  root  'wikis#index'

  resources :charges, only: [:new, :create, :destroy]
end
