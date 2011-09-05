class Administration::TagsController < Administration::MainController

  def index
    @tags = Tag.all.paginate(:per_page => 20, :page => params[:page])
  end

  def create
    tag = Tag.find_or_create_by_name(params[:tag][:name])
    post = Post.find_by_id(params[:tag][:post_id])
    unless !post and post.tags.exists?(tag)
      post.tags << tag
      result = {:tag => render_to_string(:partial => 'tag', :locals =>{:tag => tag, :post => post})}
    end
    result ||= {:error => "Association between tag_id #{tag.id} and post_id #{post.id} already exist"}
    render :json => result

  end

  def destroy
    tag = Tag.find_by_id(params[:id])
    post = Post.find_by_id(params[:post_id])
    if tag and post and post.tags.delete(tag)
      render :text => "ok"
    else
      render :text => "Error while deleting association between tag_id #{params[:id]} and post_id #{params[:post_id]}"
    end
  end

  def destroy!
    tag = Tag.find_by_id(params[:id])
    if tag
      tag.destroy
      flash[:notice] = "Tag #{tag.name} has been successfully deleted"
    else
      flash[:error] = "Could not find tag with id #{params[:id]}"
    end
    redirect_to administration_tags_path
  end

end