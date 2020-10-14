class TripRecordsController < ApplicationController
  before_action :find_trip_record, only:[:edit, :update, :destroy]
  
  def index
    if params[:site_id]
      @site = Site.find(params[:site_id])
      @trip_records = @site.trip_records.all
    else
      @trip_records = TripRecord.all
    end
  end

  def new
    @site = Site.find(params[:site_id])
    @trip_record = TripRecord.new
  end

  def create 
    @trip_record = TripRecord.create(trip_record_params) 
    if @trip_record.save
      flash[:notice] = "Trip Record sucessfully created" 
      redirect_to site_trip_records_path(params[:site_id])   
    else
      render :new
    end   
  end
  
  def edit
    @site = Site.find(params[:site_id])
  end

  def update
    if @trip_record.update(trip_record_params)
      flash[:notice] = " Trip Record Successfully Updated"
      redirect_to site_trip_records_path(params[:site_id])
    else
      render :edit
    end
  end

  def destroy
    @trip_record.destroy
    flash[:alert] = "Trip Record Deleted Successfully "
    redirect_to site_trip_records_path(params[:site_id])
  end

  private

    def find_trip_record
      @trip_record = TripRecord.find(params[:id])
    end
   
    def trip_record_params
      params.require(:trip_record).permit(:trip_date, :trip_count, :distance, :revenue, :truck_capacity, :diesel_price, :diesel_quatity, :chainage, :site_id) 
    end
end
