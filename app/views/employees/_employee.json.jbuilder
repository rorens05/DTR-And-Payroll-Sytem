json.extract! employee, :id, :name, :address, :gender, :contact_no, :email, :position, :image, :rfid_code, :hire_date, :salary_type_id, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
