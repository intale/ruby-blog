class Administration::TagsController < Administration::MainController

  def index
    @tags = Tag.all.paginate(:per_page => 20, :page => params[:page])
  end

  def create
    tag = Tag.find_by_name(params[:tag][:name])
    post = Post.find(params[:tag][:post_id])
    #    result = {:error => "#{tag.name} already added"}
    #    result = {:error => tag.errors}
    #render :json => {:tag => result}
    render :json => {:tag => tag}
  end

  def destroy
    tag = Tag.find(params[:id])
    post = Post.find(params[:post_id])
    if post.tags.delete(tag)
      render :text => "ok"
    else
      render :text => "Error while deleting association between tag_id #{tag.id} and post_id #{post.id}"
    end
  end

end