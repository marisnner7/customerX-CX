Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :customers, except: [:index] do
    resources :contacts, only: %i[new create edit]
  end
  resources :contacts, only: %i[show update destroy]
end
