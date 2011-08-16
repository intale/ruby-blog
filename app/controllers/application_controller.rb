class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def ckeditor_authenticate
    authenticate_admin!
  end

end
