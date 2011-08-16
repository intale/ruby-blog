RubyBlog::Application.routes.draw do
  devise_for :admins

  root :to => 'users#index'
  scope "/" do
    get "/post/:id" => "users#show", :as => :show_post_comments
  end

  namespace :administration do
    resources :admins, :only => :index
    resources :posts
    resources :comments, :only => [:edit, :update, :index]
  end
end
