class ChangeDateTimeToTime < ActiveRecord::Migration[5.2]
  def change
    change_column :attendances, :time_in, :time
    change_column :attendances, :time_out, :time
  end
end
