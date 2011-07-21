RubyBlog::Application.routes.draw do
  devise_for :admin

  root :to => 'users#index'
  resources :admins, :module => :administration, :only => :index
end
