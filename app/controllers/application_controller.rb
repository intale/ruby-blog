class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  protected

  def ckeditor_authenticate
    authenticate_admin!
  end

end
