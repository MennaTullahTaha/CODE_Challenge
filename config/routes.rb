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
end
