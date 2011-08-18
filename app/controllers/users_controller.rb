class UsersController < ApplicationController
  before_filter :find_post, :except => :index
  def index
    @posts = Post.includes(:admin).paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.build(params[:comment])
    @comment.current_admin = current_admin
    if @comment.save
      render :partial => "comment", :locals => {:comment => @comment}
    else
      render :json => @comment.errors
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
