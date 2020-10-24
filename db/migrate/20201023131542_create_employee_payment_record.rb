class CreateEmployeePaymentRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_payment_records do |t|
      t.date :date
      t.integer :amount
      t.string :description
      t.boolean :is_settled
      t.references :employee, index: true, foreign_key: true
    end
  end
end
