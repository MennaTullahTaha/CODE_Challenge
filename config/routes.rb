Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts

  root 'pages#home'

  get 'orphanages-signup', to: 'orphanages#new'

  get 'orphanages-posts/:orphanage_id', to: "posts#orphanage_posts", as: "orphanage_posts"

  resources :orphanages, :except =>[:new]


end
