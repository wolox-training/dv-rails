Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :books, only: %i[index show] do
    collection do
      get :info_book
    end
  end

  resources :book_suggestions, only: [:create]
  resources :users, only:[] do
    resources :rents, only: [:create, :index]
  end
end
