class Deduction < ApplicationRecord
  belongs_to :deduction_detail, foreign_key: "deduction_id"
  belongs_to :salary
end
