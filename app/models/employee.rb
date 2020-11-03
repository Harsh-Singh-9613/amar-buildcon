class Employee < ActiveRecord::Base

  has_many :attendances
  has_many :payment_records, class_name: "EmployeePaymentRecord"
  belongs_to :site

  validates_presence_of :name, :license_number, :mobile_number, :salary, :designation

  # validates :mobile_number, length: { is: 10 }

  def count_present_attendance(start_date, end_date)
    count_present_attendance = self.attendances.where(('date BETWEEN ? AND ? AND STATUS = ?'), start_date, end_date, "Present").count
  end

  def calculate_payment_given(start_date, end_date)
    calculate_payment_given = self.payment_records.where('date BETWEEN ? AND ?', start_date, end_date).map(&:amount).sum
  end
  
end