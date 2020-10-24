class Attendance < ActiveRecord::Base

  belongs_to :employee

  enum status: { Present: 'Present', Absent: 'Absent'}

  validates_presence_of :date, :status
  validates :status, inclusion: { in: statuses.keys }

end