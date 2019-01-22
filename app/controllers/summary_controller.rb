class SummaryController < ApplicationController
  def index
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



    
  end
end
