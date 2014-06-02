Knowledge::Application.routes.draw do
  resources :notes

  resources :projects

  resources :categories

  resources :comments
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "search/index", as: :search

  devise_for :users, :controllers => { :registrations => "registrations"}

  resources :posts do
    resources :comments, :only => [:create]
  end

  resources :projects_users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'user_profile' =>"posts#user_profile",as: :user_profile
  get '/post/like/:id' => "posts#like_video", as: :like
  get '/post/unlike/:id' => "posts#unlike_video", as: :unlike
  get '/dashboard/:id' => "projects#dashboard", as: :dashboard

end
