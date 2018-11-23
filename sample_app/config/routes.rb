Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'sessions/new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
    # following_user GET    /users/:id/following(.:format)          users#following
    # followers_user GET    /users/:id/followers(.:format)          users#followers
    # の2つが増える
  end

  resources :account_activations, only:[:edit]
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
