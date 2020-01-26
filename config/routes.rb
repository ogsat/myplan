Rails.application.routes.draw do
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  

  
  post 'users/create' => 'users#create'
  get "signup" => "users#new"
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/likes' => 'users#likes'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  
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
