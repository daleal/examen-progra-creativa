Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :projects
  end

  get 'projects/index', to: 'projects#index'

  root 'projects#index'
end
