class Attendance < ApplicationRecord
  belongs_to :employee
  belongs_to :day_type_name, foreign_key: "day_type", class_name: "DayType"

  scope :attendance_by_date, -> (id) {where(day_type: id)}
  
end
