class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :country, :state, :language
end
