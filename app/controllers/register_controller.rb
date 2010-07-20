class RegisterController < ApplicationController
  skip_filter :authenticate
  
  def index
  end
  
  def validate
  end
end
