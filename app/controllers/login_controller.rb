class LoginController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  skip_filter :authenticate_admin
  
  before_filter :already_logged, :except => :logout
  
  def index    
    @title = "Login"
    @moto = "Olá! "
  end
  
  def already_logged
    if session[:user]
      flash[:notice] = "You are already logged in!"
      redirect_to root_url
    end
  end
  
  def authenticate
    u = User.first(:conditions => ['email=? and password=?', params[:email], params[:password]])
    if u
      #logado = true 
      session[:user] = u.to_session_hash
      flash[:notice] = "You have successfully logged in."
      redirect_to root_url
    else
      flash[:notice] = "E-mail and password doesn't match our user database, are you registered?"
      render :action => 'index'
    end
  end
  
  def logout
    session[:user] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_url
  end
end
