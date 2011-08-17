class UsersController < ApplicationController

  def index
    @posts = Post.includes(:admin).paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create #need to rewrite
    @comment = Post.find(params[:id]).comments.build(params[:comment])
    @comment.save
    redirect_to :back

  end

end
