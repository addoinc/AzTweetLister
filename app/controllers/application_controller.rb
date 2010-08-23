# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  #filter_parameter_logging :password
  
  helper_method :current_user_session

  alias :require_user :login_required
  
  def current_user_session
    return session
  end
  
  def require_no_user
    if logged_in?
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to logout_url
      return false
    end
  end
  
end
