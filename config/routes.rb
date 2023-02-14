Rails.application.routes.draw do
  get 'ratings/create'
  get '/movies/new', to: 'movies#new'
  get 'reports/filtr_by_category'
  get '/movies/:id', to: 'movies#show'
  
  # , as: 'movie'
  resources :movies
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
end
