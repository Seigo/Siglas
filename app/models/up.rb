class Up < ActiveRecord::Base
  attr_accessible :definition_id, :user_id, :user_ip
  
  belongs_to :definition
  belongs_to :user
  
  validates_presence_of :definition_id
  validates_presence_of :user_id
  
  validates_uniqueness_of :definition_id, :scope => :user_id, :if => Proc.new { |user| user.id != 0 }  # user can't vote twice on the same def
  validates_uniqueness_of :definition_id, :scope => :user_ip  # visitors..
end
