Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'accounts'

  root 'welcome#index'
  get '/dashboard', to: 'users#dashboard'

  #resources :appointment_notes

  resources :patients do
    # nested resources for treatment plans & appointments
    resources :treatment_plans
    resources :appointments, only: :new
  end

  resources :appointments do
    # nested resources for appointment_notes
    resources :appointment_notes, :path => 'notes', only: [:create]
  end

  resources :treatment_plans do
    resources :treatments, only: [:create, :edit, :update, :destroy]
  end

end
