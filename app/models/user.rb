class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :country, :state, :language
  
  def to_session_hash
    {:id => self.id, :name => self.name, :language => self.language}
  end
end
