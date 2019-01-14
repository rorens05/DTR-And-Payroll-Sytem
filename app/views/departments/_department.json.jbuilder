json.extract! department, :id, :name, :manager, :start_time, :end_time, :created_at, :updated_at
json.url department_url(department, format: :json)
