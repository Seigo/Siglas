class Flag < ActiveRecord::Base
  attr_accessible :definition_id, :user_id, :obs
  
  belongs_to :definition
  belongs_to :user
  
  validates_presence_of :definition_id
  validates_presence_of :user_id
  validates_presence_of :obs
  
  validates_uniqueness_of :definition_id, :scope => :user_id  # user can't vote twice on the same def
  
  def get_definition
    Definition.find(:first, :conditions => {:id => self.definition_id}).definition
  end
end
