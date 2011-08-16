class Administration::PostsController < Administration::MainController

  def index
    @posts = Post.includes(:admin).paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to administration_post_path
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_admin.posts.build(params[:post])

    if @post.save
      flash[:notice] = "Post successfully saved"
      redirect_to administration_post_path(@post)
    else
      flash[:notice] = "All fields should not be null"
      render :action => :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Destroyed successfully"    
    redirect_to administration_posts_path
  end

end
