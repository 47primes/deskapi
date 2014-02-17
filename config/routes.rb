Deskapi::Application.routes.draw do
  resources :cases, only: [:index]

  resources :labels, only: [:index, :create]

  root 'cases#index'
end
