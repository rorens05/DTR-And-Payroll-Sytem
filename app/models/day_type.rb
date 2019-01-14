class DayType < ApplicationRecord
  belongs_to :employee, foreign_key: 'user_id'
  
  after_initialize :default_values

  private
    def default_values
      self.regular ||= true
    end
end
