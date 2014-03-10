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
    get '/categories/:category', to: "category#index", as: 'category'
    resources :articles, only: [:index,:show] do
      get '/tag/:tag', to: "articles#index", on: :collection, as: 'tag'
      resource :comments
    end
    get 'tips/:type', to: "tips#index", as: 'tips'
    get 'tips/:type/:year/:month', to: "tips#index", as: 'filter_tips'
  end

  match 'contact' => 'contacts#new',    as: :new_contact, via: :get
  match 'contact' => 'contacts#create', as: :contact,     via: :post

  get 'job' => 'jobs#new',    :as => :new_job
  post 'job' => 'jobs#create', :as => :job

  match 'blog' => 'blog/articles#index', as: 'blog_path'

  root :to => 'home#show'

end
