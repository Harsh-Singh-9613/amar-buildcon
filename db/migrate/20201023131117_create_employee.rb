class CreateEmployee < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :license_number
      t.integer :adhaar_number
      t.integer :mobile_number
      t.integer :salary
      t.string :designation
      t.boolean :is_working
    end
  end
end
