class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  
  def index
    
  end
  
  def search
    @sigla = Sigla.find(:first, :conditions => {:sigla => params[:sigla]})
    render :text => "#{@sigla}"
    
    #redirect_to root_url
  end
  
  def show_definitions
    
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
    
    
    # seigo code above /'\
    @title = "FMI"
    @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> Click aqui."
    @pag = "&lt; Goooooooooooooool &gt;"
  end
  
end
