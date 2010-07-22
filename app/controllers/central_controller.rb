class CentralController < ApplicationController
  layout 'base'
  skip_filter :authenticate
  
  def index
    
  end
  
  def base
    
  end

  def definition
    
    
    # seigo code above /'\
    @title = "FMI"
    @ad = "Dark Ads:<br/>Eu vi uma mulher comendo pneu e amamentando um rato!<br/> Click aqui."
    @pag = "&lt; Goooooooooooooool &gt;"
  end
  
end
