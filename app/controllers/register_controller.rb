class RegisterController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  
  def index
    @user = User.new
    @title = "Cadastro"
    @moto = "Seja bem vindo ao time dos Definidores!"
  end
  
  def register
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => "Oh! It's error with reCAPTCHA!") and @user.save
      @title = "Sucesso!"
      session[:user] = @user.to_session_hash
      flash[:notice] = "Thanks for registering! You are now logged in #{session[:user][:name]}."
      redirect_to root_url
    else
      @title = "Cadastro"
      flash[:error] = "Failed to save account #{@user.to_session_hash[:user]}."
      render :action => 'index'
    end
  end
end