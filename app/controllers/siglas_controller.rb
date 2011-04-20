class SiglasController < ApplicationController
  def index
    @siglas = Sigla.all
  end
  
  def show
    @sigla = Sigla.find(params[:id])
  end
  
  def new
    @sigla = Sigla.new
  end
  
  def create
    @sigla = Sigla.new(params[:sigla])
    if @sigla.save
      flash[:notice] = "Successfully created sigla."
      redirect_to @sigla
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sigla = Sigla.find(params[:id])
  end
  
  def update
    @sigla = Sigla.find(params[:id])
    if @sigla.update_attributes(params[:sigla])
      flash[:notice] = "Successfully updated sigla."
      redirect_to @sigla
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sigla = Sigla.find(params[:id])
    @sigla.destroy
    flash[:notice] = "Successfully destroyed sigla."
    redirect_to siglas_url
  end
end
