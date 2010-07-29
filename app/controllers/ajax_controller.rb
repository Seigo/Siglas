class AjaxController < ApplicationController
  
  def up
    @def = Definition.find(:first, :conditions => {:id => params[:definition_id]})
    
    if @def
      @up = @def.ups.new(:definition_id => params[:definition_id],
                      :user_id => session[:user][:id])

      if @up.save
        render :text => "UP vote succesfully saved!", :status => 200
      else
        render :text => "UP couldn't be saved!", :status => 403
      end
    else
      render :text => "Definition is nil!", :status => 403
    end
  end
  
  def flag
    @def = Definition.find(:first, :conditions => {:id => params[:definition_id]})
    
    if @def
      @flag = @def.flags.new(:definition_id => params[:definition_id],
                      :user_id => session[:user][:id],
                      :obs => params[:obs])

      if @flag.save
        render :text => "FLAG succesfully saved!", :status => 200
      else
        render :text => "FLAG couldn't be saved!", :status => 403
      end
    else
      render :text => "Definition is nil!", :status => 403
    end
  end
end