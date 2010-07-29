class Flag < ActiveRecord::Base
  attr_accessible :definition_id, :user_id, :obs
  
  belongs_to :definition
  belongs_to :user
  
  validates_presence_of :definition_id
  validates_presence_of :user_id
  validates_presence_of :obs
end
