class AjaxController < ApplicationController
  
  def up
    @up = @sigla.definitions.ups.new(:definition_id => params[:definition_id],
                                  :user_id => params[:user_id])

    if @up.save
      flash[:notice] = "You have successfully voted up"
    else
      flash[:error] = "Error voting definition up"
    end
  end
  
  def flag
    @flag = @sigla.definitions.flags.new(:definition_id => params[:definition_id],
                                  :user_id => params[:user_id],
                                  :obs => params[:obs])
                                  
    if @up.save
      flash[:notice] = "You have successfully flagged a definition"
    else
      flash[:error] = "Error flagging definition"
    end                             
  end
end