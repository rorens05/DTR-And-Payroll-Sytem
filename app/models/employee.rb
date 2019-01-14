class Employee < ApplicationRecord
  has_one_attached :image
  belongs_to :salary_type
  belongs_to :department
  has_many :departments
  has_many :attendance
  has_many :day_types
  has_many :leaves
  has_many :salaries
end
