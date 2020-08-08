Rails.application.routes.draw do
  root 'pages#home'

  get '/pages/:page',
      to: 'pages#show',
      as: :pages

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, except: [:new, :create] do
    get :me, on: :collection, as: :profile
    post :reset_password, on: :member
  end

  namespace :admin do
    resource :dashboard, only: :show

    namespace :permissions do
      resources :users
      resources :permission_groups do
        get '/type/:type', on: :collection, action: :index
      end
    end
  end

  # Custom Error Routes
  match '/404',
        to: 'errors#not_found',
        via: :all
  match '/500',
        to: 'errors#internal_server_error',
        via: :all
end
