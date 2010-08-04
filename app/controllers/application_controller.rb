# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '421090723c23cfb0da486c02a3f0d44b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  before_filter :authenticate
  before_filter :authenticate_admin
  
  def authenticate
    unless session[:user]
      flash[:auth_needed] = "<span id='flash'>You need to login first.</span>"
      redirect_to root_url
    end
  end
  
  def authenticate_admin
    unless session[:user][:email] == "guilhermeosawa@gmail.com" or session[:user][:email] == "fabianosoriani@gmail.com"
      flash[:auth_needed] = "<span id='flash'>Access denied.</span>"
      redirect_to root_url
    end
  end
end
