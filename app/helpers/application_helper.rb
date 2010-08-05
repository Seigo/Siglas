# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(h)
    
  end
  
  
  def field_hint( text )
    return " <br/><span class='hint'>#{text}</span> "
  end
  
  
  def right_filling()
    return "<a href='http://www.onemilliongiraffes.com'> <img src='http://www.onemilliongiraffes.com/giraffes/#{rand(60000)}.jpg' width='50%'><br/>Help the world, draw giraffes </a>" + ("<br/>"*20)
  end
  
  def url_def( str )
    #TODO pegar a lingua do user para montar URL na lingua
    "/definicao/#{str}"
    "/definicao/#{ CGI.escape(str) }"
  end
  
  def url_user( id, name )
    "/perfil/#{id}/#{ CGI.escape(name.gsub(' ','_')) }"
  end
    
end
