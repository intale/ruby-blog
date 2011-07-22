class UsersController < ApplicationController

  before_filter :search_logic

  def index
    @posts = @search.paginate(:per_page => 10, :page => params[:page])
  end

  private

  def search_logic
    defaults = {'meta_sort' => 'created_at.desc'}
    @search = Post.search(defaults.merge(params[:search] || {}))
  end

end
