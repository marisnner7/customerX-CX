Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "customers#index"

  resources :customers, except: [:index] do
    resources :contacts
  end
end
