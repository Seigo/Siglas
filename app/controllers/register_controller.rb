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
      if verify_recaptcha(:model => @user, :message => "Favor digite as letras que aparecem distorcidas para efetivar seu cadastro") && @user.save
        @title = "Sucesso!"
        session[:user] = @user.to_session_hash
        flash[:notice] = "Cadastro efetivado! Você está logado."
        redirect_to root_url
      else
        @title = "Cadastro"
        #flash[:error] = " #{@user.to_session_hash[:user]}."
        render :action => 'index'
      end
    else
      flash[:error] = ".!."
      redirect_to root_url
    end
  end
end