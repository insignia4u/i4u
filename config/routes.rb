I4u::Application.routes.draw do
  # ActiveAdmin rewrites
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'admin' => 'admin/articles#index'

  # Site rewrites
  resources :projects, :only => [:index, :show] do
    collection do
      get :list
    end
  end

  resources :people, path: :staff,    only: :index
  resources :services,                only: :index
  resources :newsletter_subscriber,   only: :create

  # Blog rewrites
  namespace :blog do
    get '/categories/:category', to: "category#index", as: 'category'
    resources :articles, only: [:index,:show] do
      resource :comments
    end
    get 'tips/:type', to: "tips#index", as: 'tips'
    get 'tips/:type/:year/:month', to: "tips#index", as: 'filter_tips'
  end

  match 'contact' => 'contacts#new',    as: :new_contact, via: :get
  match 'contact' => 'contacts#create', as: :contact,     via: :post

  get  'jobs' => 'jobs#new',    :as => :new_job
  post 'jobs' => 'jobs#create', :as => :job

  get 'blog' => 'blog/articles#index', as: 'blog_path'

  root :to => 'home#show'
end
