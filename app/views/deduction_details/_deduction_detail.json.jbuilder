json.extract! deduction_detail, :id, :name, :percentage, :fixed_deduction, :created_at, :updated_at
json.url deduction_detail_url(deduction_detail, format: :json)
