class Department < ApplicationRecord
  belongs_to :employee, foreign_key: 'manager'
  has_many :employees
end
