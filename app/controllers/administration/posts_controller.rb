class Administration::PostsController < Administration::MainController

  def index
    @posts = Post.includes(:admin).paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @post = Post.includes(:comments).find(params[:id])
  end

end