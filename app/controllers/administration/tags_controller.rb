class Administration::TagsController < Administration::MainController

  def index
    @tags = Tag.all.paginate(:per_page => 20, :page => params[:page])
  end

end