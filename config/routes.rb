Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :purchases
  end
  root 'users#main_page'
end
