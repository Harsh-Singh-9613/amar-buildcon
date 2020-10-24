module AttendancesHelper
  def check_employee_attendance_for_today(employee)
    employee.attendances.where(date: Date.current).first
  end
end
