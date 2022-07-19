Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :posts, only: [:create, :show, :index, :update, :destroy]
  resources :users, only: [:create, :show, :index, :update, :destroy]
end