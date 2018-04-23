Rails.application.routes.draw do
  resources :appointment_notes
  resources :patients do
    # nested resources for treatment plans
    resources :treatment_plans
    resources :appointments, only: :new
  end
  resources :appointments

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'accounts'

  # resources :patients do
  #   resources :appointments
  # end

  root 'welcome#index'
  get '/dashboard', to: 'users#dashboard'

end
