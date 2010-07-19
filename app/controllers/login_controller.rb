class LoginController < ApplicationController
  skip_filter :authenticate
  
  def index
  end
  
  def authenticate
    if User.first :condition => ['email=? and password=?', params[:email], params[:password]] do
      #logado = true 
    end
    
    render :text => "oi"
  end
end
