class EmployeesController < ApplicationController
  include AttendancesHelper
  before_action :find_employee, only:[:edit, :update, :destroy, :show, :mark_attendance]

  def mark_attendance
    @attendance_record = check_employee_attendance_for_today(@employee)
    if @attendance_record != nil
      @attendance_record.update(status: params[:status])
    else
      @employee.attendances.create!(date: Date.current, status: params[:status])
    end
  end
  
  def index
    @sites = Site.all
    if params[:site_id].nil? || params[:site_id] == ""
      @employees = Employee.all
    else
      @employees = Site.find(params[:site_id]).employees
    end
  end

  def new
    @sites = Site.all
    @employee = Employee.new
  end

  def create
  @employee = Employee.create(employee_params)  
    if @employee.save
      flash[:notice] = "Employee sucessfully created" 
      redirect_to employees_path  
    else
      render :new
    end   
  end
  
  def edit
    @sites = Site.all
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Employee Successfully Updated"
      redirect_to employees_path
    else
      render :edit
    end
  end

  # def destroy
  #   @employee.destroy
  #   flash[:alert] = "Employee Deleted Successfully "
  #   redirect_to employees_path
  # end

  private

    def find_employee
      @employee = Employee.find(params[:id])
    end
   
    def employee_params
      params.require(:employee).permit(:name, :license_number, :adhaar_number,:mobile_number, :salary, :designation, :is_working, :site_id )
    end
end
