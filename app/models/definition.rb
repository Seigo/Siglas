class Definition < ActiveRecord::Base
  attr_accessible :sigla_id, :definition, :creator_id, :language
  
  belongs_to :sigla # foreign key - sigla_id
  belongs_to :user # foreign key - creator_id
end
