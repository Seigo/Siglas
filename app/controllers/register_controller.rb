class RegisterController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  skip_filter :authenticate_admin
  
  def index
    @user = User.new
    @title = "Cadastro"
    @moto = "Seja bem vindo ao time dos Definidores!"
  end
  
  def register
    @user = User.new(params[:user])
    if CountryList.include_param?(@user.country) and LanguageList.include_second_param?(@user.language)
      if @user.save and verify_recaptcha(:model => @user, :message => "Erro de reCAPTCHA! Você tem certeza que você não é um robô?")
        @title = "Sucesso!"
        session[:user] = @user.to_session_hash
        flash[:notice] = "Thanks for registering! You are now logged in #{session[:user][:name]}."
        redirect_to root_url
      else
        @title = "Cadastro"
        flash[:error] = "Conta não pode ser criada #{@user.to_session_hash[:user]}."
        render :action => 'index'
      end
    else
      flash[:notice] = "What? we don't know these country and language."
      redirect_to root_url
    end
  end
end