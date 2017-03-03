Rails.application.routes.draw do
  root 'home#index'

  resources :posts do
    resources :comments
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
