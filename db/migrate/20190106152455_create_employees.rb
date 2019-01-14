class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.string :gender
      t.string :contact_no
      t.string :email
      t.string :position
      t.string :image
      t.string :rfid_code
      t.date :hire_date
      t.integer :salary_type_id
      t.integer :department_id

      t.timestamps
    end
  end
end
