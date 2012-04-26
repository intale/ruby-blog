class Administration::PostsController < Administration::MainController

  before_filter :find_post, :only => [:update, :destroy]

  def index
    @search = Post.includes(:admin).search(params[:search] || {"meta_sort" => "id.asc"})
    @posts = @search.paginate(:per_page => 20, :page => params[:page])
  end

  def edit
    @post = Post.includes(:tags).find(params[:id])
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post successfully updated"
      redirect_to administration_post_path
    else
      flash[:error] = @post.errors.full_messages
      render :action => :edit
    end
  end

  def show
    @post = Post.includes([:comments, :tags]).find(params[:id])
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
      flash[:error] = @post.errors.full_messages
      render :action => :new
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Destroyed successfully"    
    redirect_to administration_posts_path
  end

  def preview
    @tags = []
    @post= Post.find_by_id(params[:id]) || Post.new
    render :layout => 'application'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
