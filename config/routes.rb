RubyBlog::Application.routes.draw do
  devise_for :admins

  root :to => 'users#index'
end
