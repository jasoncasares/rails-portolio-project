Rails.application.routes.draw do

  #root
  root 'lists#index'

  #nested resources
  resources :lists do
    resources :tasks
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
