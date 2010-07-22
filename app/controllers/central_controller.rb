class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  
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
    
    # seigo code above /'\
    @title = params[:sigla]
    if @sigla #there are definitions for "sigla"
      @definitions = Definition.find(:all, :conditions => {:sigla_id => @sigla.id})
    else
      @definitions = nil
    end
    
    @moto = ( @definitions.size.to_s+" definição" rescue '')
    @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> <a href='#'>Click aqui.</a>"
    #@pag = "&lt; Goooooooooooooool &gt;"
  end
  
  def add_definition
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    
    if @sigla # Definition(s) exist, create a new
      @sigla.definitions.create( :definition => params[:new_definer],
                              :language => params[:definition_language],
                              :creator_id => session[:user][:id])
      flash[:notice] = "Another Def successfully created!"
      redirect_to :action => 'definition', :sigla => params[:sigla]
    else # No definitions exist, start with a new # need to create a field on Siglas table
    end
  end
  
end
