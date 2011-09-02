class Administration::TagsController < Administration::MainController

  def index
    @tags = Tag.all.paginate(:per_page => 20, :page => params[:page])
  end

  def create
    tag = Tag.find_or_create_by_name(params[:tag][:name])
    post = Post.find(params[:tag][:post_id])
    unless post.tags.exists?(tag)
      post.tags << tag
      result = {:tag => render_to_string(:partial => 'tag', :locals =>{:tag => tag, :post => post})}
    end
    result ||= {:error => "Association between tag_id #{tag.id} and post_id #{post.id} already exist"}
    render :json => result

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