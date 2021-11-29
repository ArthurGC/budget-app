Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "devise/sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
