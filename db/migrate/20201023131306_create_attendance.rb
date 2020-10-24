class CreateAttendance < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.string :status
      t.references :employee, index: true, foreign_key: true
    end
  end
end
