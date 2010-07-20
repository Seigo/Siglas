class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :country, :state, :language
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  
  def to_session_hash
    {:id => self.id, :name => self.name, :language => self.language}
  end
end
