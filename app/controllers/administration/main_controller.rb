class Administration::MainController < ActionController::Base
  before_filter :authenticate_admin!
  layout 'admin'
end
