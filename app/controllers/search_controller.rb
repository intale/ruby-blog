class SearchController < ApplicationController
  before_filter :set_request
  def index
    @is_posts=search_params=="in posts"
    if @is_posts
      @search = Post.enabled.includes(:tags, :admin).search(:message_or_subject_contains => @search_request).paginate(:per_page => 10, :page => params[:page])
      @find = @search.result(distinct: true).paginate(:per_page => 10, :page => params[:page])
    else
      @search = Comment.search(:content_contains => @search_request)#.paginate(:per_page => 10, :page => params[:page])
      @find = @search.result(distinct: true).paginate(:per_page => 10, :page => params[:page])
    end
  end

  private

  def search_params
    params.permit(:category, :content_contains, :request, :search, :page)
  end

  def set_request
    @search_request = search_params
    if @search_request.blank?
      redirect_to root_path
    end
  end

end
