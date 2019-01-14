class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :employee_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
