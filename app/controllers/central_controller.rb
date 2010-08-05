class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate, :except => [:add_definition, :profile, :edit_profile, :delete_profile]
  skip_filter :authenticate_admin
  
  def index
    @new_siglas = Sigla.all( :order => "created_at DESC", :limit => 100 )
    
    @title = "GASA"
    @moto = "Glosário de Abreviaturas Siglas e Acrônimos"
  end
  
  def definition # "Busca"
    if params[:sigla] == ""
      #flash[:notice] = "Campo de busca vazio."
      redirect_to root_url
    else
      params[:sigla] = params[:sigla].upcase
      @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
      
      @sigla.definitions.sort! {|x,y| y.ups.count <=> x.ups.count }
      
      @title = params[:sigla]
      if( @sigla )
        @moto = ( @template.pluralize(@sigla.definitions.size, 'resultados' )  )
      else
        @moto = " Trevas :("
      end
      @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> <a href='#'>Click aqui.</a>"
      #@pag = "&lt; Goooooooooooooool &gt;"
    end
  end
  
  def add_definition
    params[:sigla] = params[:sigla].upcase
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    
    @sigla = Sigla.create(:sigla => params[:sigla]) unless @sigla
    
    @def = @sigla.definitions.new( :definition => params[:new_definer],
                              :language => params[:definition_language],
                              :creator_id => session[:user][:id])
    
    if @def.save
      flash[:notice] = "Sucesso! Definição adicionada para #{@sigla.sigla}"
    else
      flash[:error] = "Erro! Todos os campos foram preenchidos?"
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
    @user = User.find session[:user][:id]
    
    if @user
      @user.name = @u[:name]
      @user.email = @u[:email]
      @user.country = @u[:country]
      @user.state = @u[:state]
      @user.language = @u[:language]
      @user.password = @u[:password]
      @user.password_confirmation = @u[:password_confirmation]
      
      if @user.save
        flash[:notice] = "Editado com sucesso!"
      else
        flash[:error] = "Não foi possível editar.."
      end
    else
      flash[:notice] = "User is nil"
    end
    
    redirect_to :action => 'profile', :id => @user.id
  end
  
  def edit_password
    
  end
  
  def delete_profile
    @user = User.find session[:user][:id]
    
    if @user.destroy
      flash[:notice] = "User account destroyed!"
    else
      flash[:error] = "Could not destroy user account!"
    end
    
    session[:user] = nil
    
    redirect_to root_url
  end
end
