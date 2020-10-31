class AttendancesController < ApplicationController
  
  def index
    @sites = Site.all
    if params[:site_id].nil?  || params[:site_id] == ""
      @employees = Employee.all
    else
      @employees = Site.find(params[:site_id]).employees
    end
  end
  
end
