Rails.application.routes.draw do
  resources :patients
  resources :appointments

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/dashboard', to: 'welcome#dashboard'
end
