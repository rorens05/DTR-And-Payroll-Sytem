class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.timestamp :time_in
      t.timestamp :time_out
      t.integer :employee_id
      t.integer :day_type

      t.timestamps
    end
  end
end
