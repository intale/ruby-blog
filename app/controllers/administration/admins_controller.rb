class Administration::AdminsController < Administration::MainController

  def index
    @admins=Admin.all
  end

end
