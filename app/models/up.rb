class Up < ActiveRecord::Base
  attr_accessible :definition_id, :user_id
  
  belongs_to :definition
  belongs_to :user
  
  validates_presence_of :definition_id
  validates_presence_of :user_id
end
