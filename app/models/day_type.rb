class DayType < ApplicationRecord
  belongs_to :employee, foreign_key: 'user_id'
  has_many :attendances, foreign_key: 'day_type'
  
  scope :sorted, -> {order(id: :desc)}

  private
    
end
