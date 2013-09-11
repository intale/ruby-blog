class Administration::CommentsController < Administration::MainController

  before_filter :find_comment, :except => [:index, :new, :create]
  before_filter :build_comment, :only => [:new, :create]
  def index
    @search = Comment.includes(:post).search(comment_params || {"meta_sort" => "id.asc"})
    @comments = @search.result(distinct: true).paginate(:per_page => 50, :page => params[:page])
  end

  def edit
  end

  def new
  end

  def update
    @comment.current_admin=current_admin
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Comment updated successfully"
      redirect_to administration_post_path(@comment.post)
    else
      flash[:error] = "Error raised while comment's update'"
      render :action => :edit
    end
  end

  def create
    if @comment.save
      flash[:notice] = "Comment created successfully"
      redirect_to administration_post_path(@post)
    else
      flash[:error] = "All fields should not be empty"
      render :action => :new
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
    redirect_to administration_post_path(@comment.post)
  end

  private

  def comment_params
    params.permit(:post_id, :content, :author, :search, :page)
  end

  def build_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.current_admin=current_admin
  end

  def find_comment
    @comment = Comment.includes(:post).find(params[:id])
  end

end
