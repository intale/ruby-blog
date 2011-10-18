class TagsController < ApplicationController

  def index
    @posts = Post.includes(:tags, :admin).where('tags.name = ?', params[:name]).enabled.order("posts.created_at DESC").paginate(:per_page => 5, :page => params[:page])
    render :template => "users/index"
  end

end
