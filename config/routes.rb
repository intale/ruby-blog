RubyBlog::Application.routes.draw do
  devise_for :admins

  root :to => 'users#index'
  scope "/" do
    get "/post/:id" => "users#show", :as => :show_post_comments
    post "/post/:id" => "users#create", :as => :create_comment
  end

  get "/administration" => "administration/comments#index"
  get "/search" => "search#index"

  namespace :administration do
    resources :admins
    resources :posts do
      resources :comments, :only => [:new, :create]
    end
    resources :comments, :except => [:new, :create]
    resources :tags
  end
end
