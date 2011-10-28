class SearchController < ApplicationController
  before_filter :set_request
  def index
    @is_posts=params[:category]=="in posts"
    if @is_posts
      @find = Post.enabled.includes(:tags, :admin).search(:message_or_subject_contains => @search_request).paginate(:per_page => 10, :page => params[:page])
    else
      @find = Comment.search(:content_contains => @search_request).paginate(:per_page => 10, :page => params[:page])
    end
  end

  private
  def set_request
    @search_request = params[:request].to_s
    if @search_request.empty?
      redirect_to root_path
    end
  end

end
