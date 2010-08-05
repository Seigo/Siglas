# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  require 'digest/md5'
  
  def gravatar_url_for(email, options = {})
    url_for({ :gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com',
              :protocol => 'http://', :only_path => false, :controller => 'avatar.php' 
            }.merge(options))  
  end
  
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
    #"/definicao/#{str}"
    "/definicao/#{ CGI.escape(str) }"
  end
  
  def url_user( id, name )
    "/perfil/#{id}/#{ CGI.escape(name.gsub(' ','_')) }"
  end
    
end
