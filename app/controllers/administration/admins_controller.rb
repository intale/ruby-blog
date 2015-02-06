class Administration::AdminsController < Administration::MainController

  before_filter :find_admin, :only => [:show, :edit, :update, :destroy]

  def index
    @search = Admin.search(admin_params || {"meta_sort" => "id.asc"})
    @admins = @search.result(distinct: true).paginate(:per_page => 10, :page => params[:page])
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def update
    if @admin.update_attributes(admin_params)
      flash[:notice] = "Account updated successfully"
      redirect_to administration_admin_path(@admin)
    else
      flash[:error] = @admin.errors.to_a
      render :action => :edit
    end
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "Account created successfully"
      redirect_to administration_admin_path(@admin)
    else
      flash[:error] = @admin.errors.to_a
      render :action => :new
    end
  end

  def destroy
    if current_admin.superadmin?
      if @admin.locked_at?
        @admin.unlock_access!
        flash[:notice] = "#{@admin.username} is enable"
      else
        @admin.lock_access!
        flash[:notice] = "#{@admin.username} is disable"
      end
    else
      flash[:error]="You can't block"
    end
    redirect_to administration_admins_path
  end

  private

  def admin_params
    params[:admin].present? &&
      params.require(:admin).permit(:email, :password, :password_confirmation, :remember_me, :username, :nick, :avatar, :subscribe, :search, :page )
  end

  def find_admin
    @admin=Admin.find_by_id(params[:id])
    unless @admin
      flash[:error]="Admin with id #{params[:id]} does not exist!"
      redirect_to administration_admins_path
    end
  end

end
