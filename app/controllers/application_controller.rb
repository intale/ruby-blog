class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers
  before_filter :find_all_tags, :except => [:create]

  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:admin) do |u|
      u.permit(:username,:name, :remember_me, :email, :password, :password_confirmation)
    end
  end

  #before_filter :update_sanitized_params, if: :devise_controller?
  #
  #def update_sanitized_params
  #  devise_parameter_sanitizer.for(:admin) {|u| u.permit(:username, :remember_me, :password)}
  #end

  def find_all_tags
    @tags = Tag.where("status='false'")
  end
  protected

  def ckeditor_authenticate
    authenticate_admin!
  end

end
