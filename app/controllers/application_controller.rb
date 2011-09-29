class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers
  before_filter :find_all_tags, :except => [:create]

  def find_all_tags
    @tags = Tag.where("status='Show'")
  end
  protected

  def ckeditor_authenticate
    authenticate_admin!
  end

end
