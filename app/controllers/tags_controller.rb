class TagsController < ApplicationController

  def index
    @posts = Post.includes(:tags, :admin).where('tags.name = ?', tag_params).enabled.order("posts.created_at DESC").paginate(:per_page => 5, :page => params[:page])
    render :template => "users/index"
  end

  private

  def tag_params
    params.permit(:name)
  end

end