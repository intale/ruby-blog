class UsersController < ApplicationController
  before_filter :find_post, :except => :index
  def index
    @posts = Post.includes(:admin).order('created_at desc').paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.build(params[:comment])
    @comment.current_admin = current_admin
    if @comment.valid_with_captcha? and @comment.save
      render :json => {:comment => render_to_string(:partial => "comment", :locals => {:comment => @comment}), :captcha => render_to_string(:partial => "captcha")}
    else
      render :json => {:errors => @comment.errors, :captcha => render_to_string(:partial => "captcha")}
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
