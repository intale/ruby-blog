class SearchController < ApplicationController
  def index
    @search_str=params[:search][:req].gsub('%','\%').gsub('_','\_').downcase
    @is_posts=params[:search][:category]=="in posts"
    if @is_posts
      @find = Post.where("lower(message) like '%#{@search_str}%' OR lower(subject) like '%#{@search_str}%'").paginate(:per_page => 20, :page => params[:page])
    else
      @find = Comment.where("lower(content) like '%#{@search_str}%'").paginate(:per_page => 20, :page => params[:page])
    end

    #@posts = Post.includes(:admin).order('created_at desc').paginate(:per_page => 5, :page => params[:page])
  end
end
