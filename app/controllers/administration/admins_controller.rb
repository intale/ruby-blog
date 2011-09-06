class Administration::AdminsController < Administration::MainController

  before_filter :find_admin, :only => [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
    @admin.build_avatar
  end

  def edit
  end

  def update
    @admin.avatar.update_attributes(params[:admin][:avatar_attributes])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Account updated successfully"
      redirect_to administration_admin_path(@admin)
    else
      flash[:error] = @admin.errors.to_a
      render :action => :edit
    end
  end

  def create
    @admin = Admin.new(params[:admin])
    @admin.build_avatar(params[:admin][:avatar_attributes])
    if @admin.save
      flash[:notice] = "Account created successfully"
      redirect_to administration_admin_path(@admin)
    else
      flash[:error] = @admin.errors.to_a
      render :action => :new
    end
  end

  def destroy
    flash[:error] = "Nel'zya udalit' admina ya skazal!"  #FIXME
    #@admin.destroy
    #flash[:notice] = "#{@admin.username} removed successfully"
    redirect_to administration_admins_path
  end

  private

  def find_admin
    @admin=Admin.find_by_id(params[:id])
    unless @admin
      flash[:error]="Admin with id #{params[:id]} does not exist!"
      redirect_to administration_admins_path
    end
  end

end
