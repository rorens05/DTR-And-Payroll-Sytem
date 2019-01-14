json.extract! attendance, :id, :time_in, :time_out, :employee_id, :day_type, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
