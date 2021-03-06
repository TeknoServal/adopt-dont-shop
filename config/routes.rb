Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#home'

  # Shelters CRUD
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#delete'

  get '/shelters/:id/pets', to: 'shelters#pets'
  get '/shelters/:id/pets/new', to: 'shelters#new_pet'

  # Pets CRUD
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  post '/pets', to: 'pets#new'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#delete'

  get 'pets/:id/applications', to: 'pets#applications'

  # Users CRUD
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'

  # Reviews CRUD
  get '/shelters/:id/reviews/new', to: 'shelter_reviews#new'
  post '/reviews', to: 'shelter_reviews#create'
  get '/reviews/:id/edit', to: 'shelter_reviews#edit'
  patch '/reviews/:id', to: 'shelter_reviews#update'
  delete '/reviews/:id', to: 'shelter_reviews#delete'

  # Applications CRUD
  get '/applications/new', to: 'applications#new'
  post '/applications', to: 'applications#create'
  get '/applications/:id', to: 'applications#show'
  patch '/applications/:id', to: 'applications#update'

  # Admin Application Interface
  get '/admin/applications/:id', to: 'adminapps#show'
  patch '/admin/applications/:app_id/pets/:pet_id', to: 'adminapps#pet_update'
end
