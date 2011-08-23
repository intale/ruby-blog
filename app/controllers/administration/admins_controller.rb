class Administration::AdminsController < Administration::MainController

  before_filter :find_admin, :only => [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        flash[:notice] = "Account updated successfully"
        format.html { redirect_to administration_admin_path(@admin) }
        format.xml { head :ok }
      else
        flash[:error] = "Error!"
        format.html { render :action => :edit }
        format.xml { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    @admin = Admin.new(params[:admin])
    respond_to do |format|
      if @admin.save
        flash[:notice] = "Account created successfully"
        format.html { redirect_to administration_admin_path(@admin) }
        format.xml { head :ok }
      else
        flash[:error] = "Error!"
        format.html { render :action => :new }
        format.xml { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
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
    @admin = Admin.find(params[:id])
  end

end
