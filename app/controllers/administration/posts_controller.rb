class Administration::PostsController < Administration::MainController

  def index
    @posts = Post.includes(:admin).paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @post = Post.includes(:comments).find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to administration_post_path
  end

  def show
    @post = Post.find(params[:id])
  end

end