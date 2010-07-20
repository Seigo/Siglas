class LoginController < ApplicationController
  skip_filter :authenticate
  
  def index
  end
  
  def authenticate
    u = User.first(:conditions => ['email=? and password=?', params[:email], params[:password]])
    if u
      #logado = true 
      session[:user] = u.to_session_hash
      render :text => "member account found! =>" + session[:user].to_s
    else
      render :text => "member account not found." 
    end
  end
  
  def logout
    session[:user] = nil
    
    redirect_to root_url
  end
end
