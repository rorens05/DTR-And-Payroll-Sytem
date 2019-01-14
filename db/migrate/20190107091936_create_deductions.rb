class CreateDeductions < ActiveRecord::Migration[5.2]
  def change
    create_table :deductions do |t|
      t.integer :deduction_id
      t.integer :salary_id

      t.timestamps
    end
  end
end
