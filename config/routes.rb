Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts

  root 'pages#home'

  get 'orphanages-signup', to: 'orphanages#new'

  get 'orphanages-posts/:orphanage_id', to: "posts#orphanage_posts", as: "orphanage_posts"

  resources :orphanages, :except =>[:new]

  get 'orphanages-login', to: 'sessions#new_orphanage'

  post 'orphanages-login', to: 'sessions#create_orphanage'

  get 'volunteers-login', to: 'sessions#new_volunteer'

  post 'volunteers-login', to: 'sessions#create_volunteer'

  delete 'logout', to: 'sessions#destroy'

  resources :volunteers, :except =>[:new]

  get 'volunteers-signup', to: 'volunteers#new'

  get 'view-volunteering-activity', to: 'orphanage_volunteers#volunteer_activities'

  get 'view-current-volunteers', to: 'orphanage_volunteers#current_volunteers'

  get 'schedule-time', to: 'appointments#new'

  post 'schedule-time', to: 'appointments#create'

  get 'view-pending-appointments', to: 'appointments#pending_appointments'

  get 'approve-appointment/:appointment_id', to: 'appointments#approve_appointment', as: "approve_appointment"

  get 'view-approved-appointments', to: 'appointments#approved_appointments', as: "view_approved_appointments"

  delete 'cancel-appointment/:appointment_id', to: 'appointments#cancel_appointment', as: "cancel_appointment"

  get 'faqs', to: 'pages#FAQS'

  resources :appointments, :except => [:new, :create, :destroy, :edit, :update]
  
end
