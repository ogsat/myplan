Rails.application.routes.draw do

  post 'users/create' => 'users#create'
  get "signup" => "users#new"
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  
  get 'plans/index' => 'plans#index'
  get 'plans/new' => 'plans#new'
  get 'plans/:id' => 'plans#show'
  post 'plans/create' => 'plans#create'
  get 'plans/:id/edit' => 'plans#edit'
  patch 'plans/:id/update' => 'plans#update',as:'post'
  post 'plans/:id/destroy' => 'plans#destroy'

  get '/' => 'home#top'
  get '/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
