class ChangeColumnDataTypeInEmployee < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :mobile_number, :string
    change_column :employees, :license_number, :string
    change_column :employees, :adhaar_number, :string
  end
end
