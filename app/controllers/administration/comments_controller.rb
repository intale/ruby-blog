class Administration::CommentsController < Administration::MainController

  def edit
    @comment = Comment.includes(:post).find(params[:id])
  end

  def index
    @comments = Comment.includes(:post).paginate(:per_page => 50, :page => params[:page])
  end

  def update
    @comment = Comment.includes(:post).find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment updated successfully"
      redirect_to administration_post_path(@comment.post)
    else
      flash[:notice] = "Error raised while comment's update'"
      render :action => :edit
    end
  end

end
