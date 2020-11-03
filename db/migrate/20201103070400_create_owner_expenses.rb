class CreateOwnerExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :owner_expenses do |t|
      t.date :date
      t.bigint :amount
      t.string :description
      t.references :owner, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
