I4u::Application.routes.draw do
  ActiveAdmin.routes(self)

  # get '/blog/articles/capacitacion-ruby-on-rails-studio', to: redirect('/blog/articles/capacitacion-git-y-github-edicion-abril', status: 302)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects, only: [:index, :show] do
    collection do
      get :list
    end
  end

  resources :people, path: :team,    only: :index
  resources :services,                only: :index

  namespace :blog do
    get '/categories/:category', to: "category#index", as: 'category'
    resources :articles, only: [:index,:show] do
      resource :comments, only: [:create]
    end
    get 'tips/:type', to: "tips#index", as: 'tips'
    get 'tips/:type/:year/:month', to: "tips#index", as: 'filter_tips'
  end

  post '/subscribe' => 'subscriptions#create'

  get  '/contact' => 'contacts#new'
  post '/contact' => 'contacts#create'

  get  '/jobs' => 'jobs#new'
  post '/jobs' => 'jobs#create'

  match 'blog' => 'blog/articles#index', as: 'blog_path'
  match '/:slug' => 'blog/articles#slug', slug: /[a-zA-Z0-9\-]+/

  root to: 'home#show'
end
