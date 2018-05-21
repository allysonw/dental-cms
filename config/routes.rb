Rails.application.routes.draw do

  resources :announcements
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'accounts'

  root 'welcome#index'
  get '/dashboard', to: 'users#dashboard'

  resources :patients do
    # nested resources for treatment plans & appointments
    resources :treatment_plans
    resources :appointments, only: :new
  end

  resources :appointments do
    # nested resources for appointment_notes
    resources :appointment_notes, :path => 'notes', only: [:create, :index]
  end

  # routes for treatments
  post '/treatment_plans/:treatment_plan_id/treatments', to: 'treatments#create', as: 'treatment_plan_treatments'
  delete '/treatment_plans/:treatment_plan_id/treatments/:id', to: 'treatments#destroy', as: 'treatment_plan_treatment'
  post '/treatments/:id/complete', to: 'treatments#complete'

end
