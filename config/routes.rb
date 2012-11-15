I4u::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects, :path => :portfolio, :only => [:index, :show] do
    collection do
      get :list
    end
  end

  #FIXED IT: Hardcode root
  match 'example_case' => 'projects#caso', via: 'get'

  resources :people,   :only => :index
  resources :services, :only => :index

  match 'contact' => 'contacts#new',    :as => :new_contact, :via => :get
  match 'contact' => 'contacts#create', :as => :contact,     :via => :post

  match 'job' => 'jobs#new',    :as => :new_job, :via => :get
  match 'job' => 'jobs#create', :as => :job,     :via => :post

  root :to => 'home#show'
end
