class Salary < ApplicationRecord
  belongs_to :employee
  has_many :deduction
end
