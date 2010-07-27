class Sigla < ActiveRecord::Base
  attr_accessible :sigla
  
  has_many :definitions
  
  validates_presence_of :sigla
end
