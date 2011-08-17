RubyBlog::Application.routes.draw do
  devise_for :admins

  root :to => 'users#index'
  scope "/" do
    get "/post/:id" => "users#show", :as => :show_post_comments
  end

  namespace :administration do
    resources :admins
    resources :posts do
      resources :comments, :only => [:new, :create]
    end
    resources :comments, :except => [:new, :create]
  end
end
