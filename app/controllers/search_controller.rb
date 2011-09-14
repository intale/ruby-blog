class SearchController < ApplicationController
  def index
    @is_posts=params[:search][:category]=="in posts"
    if @is_posts
      @find = Post.search(:message_or_subject_contains=>params[:search][:request]).paginate(:per_page => 10, :page => params[:page])
    else
      @find = Comment.search(:content_contains=>params[:search][:request]).paginate(:per_page => 10, :page => params[:page])
    end
  end
end
