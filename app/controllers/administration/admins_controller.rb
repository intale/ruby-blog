class Administration::AdminsController < Administration::MainController

  before_filter :find_admin, :only => [:show, :edit, :update, :destroy]

  def index
    @search = Admin.search(params[:search] || {"meta_sort" => "id.asc"})
    @admins = @search.paginate(:per_page => 10, :page => params[:page])

  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def update
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
    if @admin.save
      flash[:notice] = "Account created successfully"
      redirect_to administration_admin_path(@admin)
    else
      flash[:error] = @admin.errors.to_a
      render :action => :new
    end
  end

  def destroy

    if @admin.locked_at?
      @admin.unlock_access!
      flash[:notice] = "#{@admin.username} is enable"
    else
      @admin.lock_access!
      flash[:notice] = "#{@admin.username} is disable"
    end
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
