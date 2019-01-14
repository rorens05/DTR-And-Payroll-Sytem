class LeaveDetail < ApplicationRecord
  has_many :leaves, class_name: :Leave, foreign_key: "leave_details_id"
end
