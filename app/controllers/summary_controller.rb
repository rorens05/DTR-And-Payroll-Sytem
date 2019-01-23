class SummaryController < ApplicationController
  def index
    @regular_time_in = Time.new().change(year: 2000, month: 1, day: 1, hour: 8, min: 0, sec: 0)
    @regular_time_out = Time.new().change(year: 2000, month: 1, day: 1, hour: 18, min: 0, sec: 0)
    
    @employees = Employee.all
    
    if params[:month].present?
      selected_date = params[:month].split('-')
      @time = Time.new(selected_date[0].to_i, selected_date[1].to_i)
      @day_types = DayType.all.where("MONTH(created_at) = #{selected_date[1]} and YEAR(created_at) = #{selected_date[0]}");
    else
      @time = Time.now
      month = @time.strftime("%m")
      year = @time.strftime("%Y")
      @day_types = DayType.all.where("MONTH(created_at) = #{month} and YEAR(created_at) = #{year}");
    end

    @attendance_today = Attendance.all.where(day_type: DayType.all.last)

    @late_employees = 0
    
    @attendance_today.each do |attendance|
      if attendance.time_in > @regular_time_in
        @late_employees = @late_employees + 1
      end
    end
    


    
  end
end
