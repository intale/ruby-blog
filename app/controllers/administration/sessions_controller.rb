class Administration::AdminsController < Devise::RegistrationsController
  private :admins_params
  def sign_up_params
    params.require(:admin).permit(:username)
  end


end