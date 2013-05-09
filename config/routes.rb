I4u::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects, :only => [:index, :show] do
    collection do
      get :list
    end
  end

  resources :people,:path => :staff,  only: :index
  resources :services,                only: :index
  resources :newsletter_subscriber,   only: :create

  namespace :blog do
    resources :articles, only: [:index,:show]
  end

  match 'contact' => 'contacts#new',    as: :new_contact, via: :get
  match 'contact' => 'contacts#create', as: :contact,     via: :post

  match 'job' => 'jobs#new',    :as => :new_job, :via => :get
  match 'job' => 'jobs#create', :as => :job,     :via => :post

  match 'blog' => 'blog/articles#index', as: 'blog_path'

  root :to => 'home#show'

end
