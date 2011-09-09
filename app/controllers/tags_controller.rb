class TagsController < ApplicationController

  def index
    @posts = Post.includes(:tags).where('tags.name = ?', params[:name]).paginate(:per_page => 5, :page => params[:page])
    render :template => "users/index"
  end

end
