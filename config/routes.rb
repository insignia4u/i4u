I4u::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects, :path => :portfolio, :only => [:index, :show] do
    collection{ get :list }
  end

  resources :people, :only => :index

  resources :messages, :path => :contact, :only => [:new, :create]

  root :to => 'home#show'
end
