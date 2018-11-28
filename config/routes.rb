Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :books, only: [:show, :index]

  resources :users, only:[] do
    resources :rents, only: [:create, :index]
  end
end
