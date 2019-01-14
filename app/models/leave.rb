class Leave < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_detail, foreign_key: "leave_details_id"
end
