Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts

  root 'pages#home'

  get 'orphanages-signup', to: 'orphanages#new'

  resources :orphanages, :except =>[:new]


end
