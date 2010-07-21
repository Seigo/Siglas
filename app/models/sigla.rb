class Sigla < ActiveRecord::Base
  attr_accessible :sigla
  
  has_many :definitions
  
end
