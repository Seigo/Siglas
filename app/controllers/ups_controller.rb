class UpsController < ApplicationController
  def index
    @ups = Up.all
  end
  
  def show
    @up = Up.find(params[:id])
  end
  
  def new
    @up = Up.new
  end
  
  def create
    @up = Up.new(params[:up])
    if @up.save
      flash[:notice] = "Successfully created up."
      redirect_to @up
    else
      render :action => 'new'
    end
  end
  
  def edit
    @up = Up.find(params[:id])
  end
  
  def update
    @up = Up.find(params[:id])
    if @up.update_attributes(params[:up])
      flash[:notice] = "Successfully updated up."
      redirect_to @up
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @up = Up.find(params[:id])
    @up.destroy
    flash[:notice] = "Successfully destroyed up."
    redirect_to ups_url
  end
end
