class UsersController < ApplicationController

  def index
    @posts = Post.includes(:admin).paginate(:per_page => 5, :page => params[:page])
  end

end
