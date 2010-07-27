class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate, :except => :add_definition
  
  def index
    @title = "Open Siglas"
    @moto = "Acreditamos no poder social!"
  end
  
=begin
  def add_definition_for_sigla
    if @sigla == nil
      # there's no definitions for this sigla yet
      @sigla = Sigla.new(params[:sigla])
      if @sigla.save
        flash[:notice] = "New sigla added to database."
        # definition attribuition
        
        render :action => 'add_definition'
      else
        flash[:notice] = "Failed to create a new sigla."
        render :action => 'index'
      end
    else
      # add another definition for the sigla  # definition attribuition
      render :action => 'index'
    end
  end
  
  def add_definition
    @definition = Definition.new( :sigla_id => @sigla[:id],
                                  :definition => params[:definition],
                                  :creator_id => session[:user[:id]],
                                  :language => params[:language])
                                  # :sigla_id, :definition, :creator_id, :language
  end
=end

  def definition
    params[:sigla] = params[:sigla].upcase
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    
    @title = params[:sigla]
    
    @moto = ( @sigla.definitions.size.to_s + " definição(ões)" rescue '')
    @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> <a href='#'>Click aqui.</a>"
    #@pag = "&lt; Goooooooooooooool &gt;"
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
