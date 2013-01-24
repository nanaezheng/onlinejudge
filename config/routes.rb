LepusServer::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  mathjax 'mathjax'
  resources :submissions

  match 'problems', :controller => 'problems', :action => 'change', :via => :post

  resources :problems do
    member do
      get 'submit'
    end
  end

  devise_for :users

  root :to => 'static_pages#index'
end
