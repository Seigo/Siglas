class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate, :except => :add_definition
  
  def index
    @title = "Open Siglas"
    @moto = "Acreditamos no poder social!"
  end

  def definition # "Busca"
    if params[:sigla] == ""
      flash[:notice] = "Search parameter is blank."
      redirect_to root_url
    else
      params[:sigla] = params[:sigla].upcase
      @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
      
      @title = params[:sigla]
      
      @moto = ( @sigla.definitions.size.to_s + " definição(ões)" rescue '')
      @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> <a href='#'>Click aqui.</a>"
      #@pag = "&lt; Goooooooooooooool &gt;"
    end
  end
  
  def add_definition
    params[:sigla] = params[:sigla].upcase
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    
    if @sigla # Definition(s) exist, create a new
      @def = @sigla.definitions.new( :definition => params[:new_definer],
                              :language => params[:definition_language],
                              :creator_id => session[:user][:id])
                              
    else # No definitions exist, start with a new # new entry on Siglas table
      @sigla = Sigla.create(:sigla => params[:sigla])
      @def = @sigla.definitions.new( :definition => params[:new_definer],
                              :language => params[:definition_language],
                              :creator_id => session[:user][:id])

    end
    
    if @def.save
      flash[:notice] = "Another definition successfully added for #{@sigla.sigla}"
    else
      flash[:error] = "Error creating definition! Are all fields filled?"
    end
    redirect_to :action => 'definition', :sigla => params[:sigla]
  end
  
end
