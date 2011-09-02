class SearchController < ApplicationController
  def index
    search_str=params[:search][:req].gsub('%','\%').gsub('_','\_').downcase
    @posts = Post.where("lower(message) like '%#{search_str}%' OR lower(subject) like '%#{search_str}%'").all
    @comments = Comment.where("lower(content) like '%#{search_str}%'").all

    #@posts = Post.includes(:admin).order('created_at desc').paginate(:per_page => 5, :page => params[:page])
  end
end
