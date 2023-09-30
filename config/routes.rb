Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "main#index"
  resources :products, only: [:new, :create, :index, :update]
end
