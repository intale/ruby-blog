class UsersController < ApplicationController
  before_filter :find_post, :except => [:index,:about_us]
  def index
    @posts = Post.includes(:admin).order("posts.created_at DESC").paginate(:per_page => 5, :page => params[:page])
    @tags = Tag.all
  end

  def about_us
    @admins = Admin.all
  end

  def show
    @comments = @post.comments
    @tags = @post.tags
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
    unless @post = Post.find_by_id(params[:id])
      redirect_to root_path
      flash[:error] = "Post not found"
    end
  end

end
