class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.integer :employee_id
      t.integer :leave_details_id
      t.date :date_stated

      t.timestamps
    end
  end
end
