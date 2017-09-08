Rails.application.routes.draw do

  get 'home/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :answers do
    resources :wrongs, only: :show
    resources :corrects, only: :show
    resources :checks, only: :create
  end

  root to: 'home#index'
  resources :exercises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
