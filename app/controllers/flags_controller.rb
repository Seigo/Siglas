class FlagsController < ApplicationController
  def index
    @flags = Flag.all(:conditions => {:accepted => nil})
    @history = Flag.all(:conditions => ["accepted = ? or accepted = ?", true, false])
  end
  
  def show
    @flag = Flag.find(params[:id])
  end
  
  def new
    @flag = Flag.new
  end
  
  def create
    @flag = Flag.new(params[:flag])
    if @flag.save
      flash[:notice] = "Successfully created flag."
      redirect_to @flag
    else
      render :action => 'new'
    end
  end
  
  def edit
    @flag = Flag.find(params[:id])
  end
  
  def update
    @flag = Flag.find(params[:id])
    if @flag.update_attributes(params[:flag])
      flash[:notice] = "Successfully updated flag."
      redirect_to @flag
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy
    flash[:notice] = "Successfully destroyed flag."
    redirect_to flags_url
  end
  
  def ok
    @flag = Flag.find(params[:id])
    
    if @flag.update_attribute(:accepted, true)
      render :text => "Flag checked"
    else
      render :text => "Failed to check flag"
    end
  end
  
  def deny
    @flag = Flag.find(params[:id])
    
    if @flag.update_attribute(:accepted, false)
      render :text => "Flag ignored"
    else
      render :text => "Failed to ignore flag"
    end
  end
  
  # AJAX

 
 
end
