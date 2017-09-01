Rails.application.routes.draw do

  namespace :answers do
    resources :wrongs, only: :show
    resources :corrects, only: :show
    resources :checks, only: :create
  end

  root to: 'exercises#index'
  resources :exercises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
