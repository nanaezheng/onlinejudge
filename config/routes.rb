LepusServer::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  mathjax 'mathjax'

  resources :submissions

  resources :problems do
    member do
      get 'submit'
    end
  end

  devise_for :users

  root :to => 'static_pages#index'
end
