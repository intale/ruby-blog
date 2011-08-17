class Administration::CommentsController < Administration::MainController

  before_filter :find_comment, :except => :index

  def index
    @comments = Comment.includes(:post).paginate(:per_page => 50, :page => params[:page])
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment updated successfully"
      redirect_to administration_post_path(@comment.post)
    else
      flash[:error] = "Error raised while comment's update'"
      render :action => :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
    redirect_to administration_post_path(@comment.post)
  end

  private

  def find_comment
    @comment = Comment.includes(:post).find(params[:id])
  end

end
