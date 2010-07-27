class Definition < ActiveRecord::Base
  attr_accessible :sigla_id, :definition, :creator_id, :language
  
  belongs_to :sigla # foreign key - sigla_id
  belongs_to :user, :foreign_key => :creator_id # foreign key - creator_id
  
  validates_presence_of :sigla_id
  validates_presence_of :definition
  validates_presence_of :creator_id
  validates_presence_of :language
end
