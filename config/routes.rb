LepusServer::Application.routes.draw do
  resources :submissions

  resources :problems do
    member do
      get 'submit'
    end
  end

  devise_for :users

  root :to => 'static_pages#index'
end
