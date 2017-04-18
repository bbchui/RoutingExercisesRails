Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/' => 'users#index', :as => 'all_users'
  post 'users/' => 'users#create', :as => 'create_new_user'
  get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  get 'users/:id' => 'users#show', :as => 'show_user'
  patch 'users/:id' => 'users#update', :as => 'patch_update_user'
  put 'users/:id' => 'users#update', :as => 'put_update_user'
  delete 'users/:id' => 'users#destroy', :as => 'destroy_user'

  resources :artwork_shares, only: [:create, :destroy]

  get '/users/:user_id/artworks' => 'artworks#index', :as => 'user_artworks'

  resources :artworks, exception: [:index]

  resources :comments, only: [:create, :destroy, :index]

  resources :likes, only: [:create, :destroy, :index]
end
