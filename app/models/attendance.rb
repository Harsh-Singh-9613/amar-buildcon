class Attendance < ActiveRecord::Base

  belongs_to :employee

  enum status: { present: 'Present', absent: 'Absent'}

end