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

  get 'eligibility_criteria', to: 'pages#eligibility_criteria'

  get 'procedures_documents_required', to: 'pages#procedures_documents_required'

  get 'what_is_Kafala', to: 'pages#what_is_kafala'

  get 'Kafala_Stories', to: 'pages#kafala_stories'

  get 'Shaymaa_Story', to: 'pages#shaymaa_story'

  get 'Yasmin_Story', to: 'pages#yasmin_story'

  get 'Sara_Story', to: 'pages#sara_story'

  get 'Fatima_Story', to: 'pages#fatima_story'

  get 'Marwa_Story', to: 'pages#marwa_story'

  get 'Hamza_Story', to: 'pages#hamza_story'

  resources :report_cases, :except => [:new, :edit, :update, :destroy]

  get 'report-new-case', to: 'report_cases#new', as: "report_new_case"

  get 'view-reported-cases', to: 'report_case#volunteer_reported_cases', as: "view_reported_cases"

  get 'view-pending-cases', to: 'report_case#view_pending_cases', as: "view_pending_cases"

  get 'accepted_cases', to: 'report_case#orphanage_accepted_cases', as: "accepted_cases"

  get 'accept_case/:case_id', to: 'report_case#accept_case'

  resources :appointments, :except => [:new, :create, :destroy, :edit, :update]
  
end
