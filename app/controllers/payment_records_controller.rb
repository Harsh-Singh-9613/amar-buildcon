class PaymentRecordsController < ApplicationController
  before_action :find_payment_record, only:[:edit, :update, :destroy]
  before_action :find_employee, only:[:edit, :index, :new]
  
  def index
    @payment_records = @employee.payment_records
  end

  def new
    @payment_record = EmployeePaymentRecord.new
  end

  def create
    @payment_record = EmployeePaymentRecord.create(payment_record_params)  
    if @payment_record.save
      flash[:notice] = "Payment Record sucessfully created" 
      redirect_to employees_path  
    else
      render :new
    end   
  end
  
  def edit
    @employee = Employee.find(params[:employee_id])
  end

  def update
    @employee = Employee.find(params[:employee_id])
    if @payment_record.update(payment_record_params)
      flash[:notice] = "Payment Record Successfully Updated"
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end


  private

    def find_payment_record
      @payment_record = EmployeePaymentRecord.find(params[:id])
    end

    def find_employee
      @employee = Employee.find(params[:employee_id])
    end
   
    def payment_record_params
      params.require(:employee_payment_record).permit(:date, :amount, :description, :employee_id) 
    end
end
