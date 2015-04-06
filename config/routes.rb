Rails.application.routes.draw do
  root 'welcome#index'

  resources :players, only: [:index, :show, :new, :create]
  resources :matches, only: [:index, :new, :create]
end
