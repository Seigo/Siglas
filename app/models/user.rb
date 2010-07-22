class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :country, :state, :language, :password_confirmation
  
  has_many :definitions
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :allow_blank => true
  validates_format_of :name, :with => /^[-\w\._@ ]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_2+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  #validate_on_create :password_match
  
  #def password_match    errors.add_to_base("Password does not match :S") if self.password != self.password_confirmation  end
  
  
  def to_session_hash
    {:id => self.id, :name => self.name, :language => self.language}
  end
end
