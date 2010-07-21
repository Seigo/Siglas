class DefinitionsController < ApplicationController
  def index
    @definitions = Definition.all
  end
  
  def show
    @definition = Definition.find(params[:id])
  end
  
  def new
    @definition = Definition.new
  end
  
  def create
    @definition = Definition.new(params[:definition])
    if @definition.save
      flash[:notice] = "Successfully created definition."
      redirect_to @definition
    else
      render :action => 'new'
    end
  end
  
  def edit
    @definition = Definition.find(params[:id])
  end
  
  def update
    @definition = Definition.find(params[:id])
    if @definition.update_attributes(params[:definition])
      flash[:notice] = "Successfully updated definition."
      redirect_to @definition
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @definition = Definition.find(params[:id])
    @definition.destroy
    flash[:notice] = "Successfully destroyed definition."
    redirect_to definitions_url
  end
end
