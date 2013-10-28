class Administration::TagsController < Administration::MainController

    before_filter :find_post, :only => [:create, :destroy]
    before_filter :find_tag, :only => [:edit, :update, :destroy!, :destroy]

  def index
    @search = Tag.search(tag_params || {"meta_sort" => "id.asc"})
    @tags = @search.result(distinct: true).paginate(:per_page => 20, :page => params[:page])
  end

  def create
    tag = Tag.find_or_create_by(:name => tag_params)
    unless @post.nil? or @post.tags.exists?(tag)
      @post.tags << tag
      result = {:tag => render_to_string(:partial => 'tag', :locals =>{:tag => tag, :post => @post})}
    end
    result ||= {:error => "Association between tag_id #{tag.id} and post_id #{params[:post_id]} already exist or post not found"}
    render :json => result
  end

  def update
    if @tag.update_attributes(tag_params)
      flash[:notice] = "Updated successfully"
      redirect_to administration_tags_path
    else
      flash[:error] = @tag.errors.to_a
      render :action => :edit
    end
  end

  def search_tag
    tag = Tag.where("LOWER(name) LIKE (?)", "%#{params[:q].to_s.downcase}%")
    render :text => tag.map(&:name).uniq.join("\n")
  end

  def destroy
    if @tag and @post and @post.tags.delete(@tag)
      render :text => "ok"
    else
      render :text => "Error while deleting association between tag_id #{params[:id]} and post_id #{params[:post_id]}"
    end
  end

  def destroy!
      @tag.destroy
      flash[:notice] = "Tag #{@tag.name} has been successfully deleted"
      redirect_to administration_tags_path
  end

  private

  def tag_params
    params.permit(:name, :post_id, :q, :search, :page)
  end

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def find_tag
    unless @tag = Tag.find_by(:id => tag_params)
      flash[:error] = "Tag with id #{params[:id]} not found"
      redirect_to administration_tags_path unless request.xhr?
    end
  end

end