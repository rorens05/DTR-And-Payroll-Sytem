class DayType < ApplicationRecord
  belongs_to :employee, foreign_key: 'user_id'
  has_many :attendances
  
  scope :sorted, -> {order(id: :desc)}

  private
    
end
