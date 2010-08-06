class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate, :except => [:add_definition, :config, :edit_profile, :edit_password, :delete_profile]
  skip_filter :authenticate_admin
  
  def index
    @new_siglas = Sigla.all( :order => "created_at DESC", :limit => 100 )
    
    #@title = "GASA" #img now
    @moto = "Glosário de Abreviaturas Siglas e Acrônimos"
  end
  
  def definition # "Busca"
    if params[:sigla] == ""
      #flash[:notice] = "Campo de busca vazio."
      redirect_to root_url
    else
      params[:sigla] = params[:sigla].upcase
      params[:sigla].strip
      
      @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
      
      @sigla.definitions.sort! {|x,y| y.ups.count <=> x.ups.count } if @sigla
      
      @title = params[:sigla]
      if( @sigla )
        @moto = ( @template.pluralize(@sigla.definitions.size, 'resultado' )  )
      else
        @moto = " Trevas :("
      end
      @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> <a href='#'>Click aqui.</a>"
      #@pag = "&lt; Goooooooooooooool &gt;"
    end
  end
  
  def add_definition
    params[:sigla] = params[:sigla].upcase
    params[:sigla].strip
    
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    
    Sigla.transaction do
      @sigla = Sigla.create(:sigla => params[:sigla]) unless @sigla
      
      params[:new_definer].strip
      if LanguageList.include_second_param?(params[:definition_language])
        @def = @sigla.definitions.new( :definition => params[:new_definer],
                                  :language => params[:definition_language],
                                  :creator_id => session[:user][:id])
        
        if @def.save
          flash[:notice] = "Sucesso! Definição adicionada para #{@sigla.sigla}"
        else
          flash[:error] = "Erro! Todos os campos foram preenchidos?"
          raise ActiveRecord::Rollback
        end
      else
        flash[:notice] = "Não conhecemos a linguagem inserida."
        raise ActiveRecord::Rollback
      end
    end
    redirect_to :action => 'definition', :sigla => params[:sigla]
  end
  
  def profile
    @user = User.find  params[:id]#session[:user][:id]
    @siglas = []
    @user.definitions.each{ |d| @siglas.push(d.sigla) }
    @siglas.uniq!
    
    @title = @user.name
    @moto = "Usuário desde #{ @user.created_at.to_date.to_s_br }"
  end
  
  def config
    @user = User.find session[:user][:id]
    
    @title = @user.name
    @moto = "Ultima alteração em #{ @user.updated_at.to_date.to_s_br }"
  end
  
  def edit_profile
    @u = params[:user]
    @user = User.find session[:user][:id]
    
    if @user and CountryList.include_param?(@u[:country]) and LanguageList.include_second_param?(@u[:language])
      @user.name = @u[:name]
      @user.email = @u[:email]
      @user.country = @u[:country]
      #@user.state = @u[:state]
      @user.language = @u[:language]
      #@user.password = @u[:password]
      #@user.password_confirmation = @u[:password_confirmation]
      
      if @user.save
        flash[:notice] = "Editado com sucesso!"
        redirect_to :action => 'config'
      else
        flash[:error] = "Não foi possível editar.."
        render :action => 'config'
      end
    else
      flash[:notice] = "Você não está logado, ou inseriu país ou língua desconhecidos."
      render :action => 'config'
    end
  end
  
  def edit_password
    @u = params[:user]
    @user = User.find session[:user][:id]
    
    if @user
      @user.password = @u[:password]
      @user.password_confirmation = @u[:password_confirmation]
      
      if @user.save
        flash[:notice] = "Seu password foi alterado com sucesso!"
        redirect_to :action => 'config'
      else
        flash[:error] = "Não foi possível alterar.."
        render :action => 'config'
      end
    else
      flash[:notice] = "Você não está logado."
      render :action => 'config'
    end
  end
  
  def delete_profile
    @user = User.find session[:user][:id]
    
    if @user.destroy
      session[:user] = nil
      flash[:notice] = "Conta deletada!"
    else
      flash[:error] = "Conta não pode ser deletada!"
    end
    
    redirect_to root_url
  end
end
