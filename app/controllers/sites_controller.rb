class SitesController < ApplicationController

  before_action :find_site, only:[:edit, :update, :destroy]
  
  def index
     @sites = Site.all
  end

  def new
     @site = Site.new
  end

  def create
  @site = Site.create(site_params)  
    if @site.save
      flash[:notice] = "Site sucessfully created" 
      redirect_to sites_path    
    else
      render :new
    end   
  end
  
  def edit
  end

  def update
    if @site.update(site_params)
      flash[:notice] = " Site Successfully Updated"
      redirect_to sites_path
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    flash[:alert] = "Site Deleted Successfully "
    redirect_to sites_path
  end

  private

    def find_site
      @site = Site.find(params[:id])
    end
   
    def site_params
      params.require(:site).permit(:name, :default_truck_capacity,:lnt_basic_charge,:lnt_leading_charge, :excavation_charges) 
    end
end
    
