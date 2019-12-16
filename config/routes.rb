Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :projects
  end

  get 'projects/catalog', to: 'projects#catalog'

  root 'projects#catalog'
end
