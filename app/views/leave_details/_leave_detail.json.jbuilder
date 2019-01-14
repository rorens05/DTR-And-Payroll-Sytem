json.extract! leave_detail, :id, :name, :is_payed, :number_of_days, :created_at, :updated_at
json.url leave_detail_url(leave_detail, format: :json)
