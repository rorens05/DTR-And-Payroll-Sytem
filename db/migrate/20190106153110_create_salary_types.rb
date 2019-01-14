class CreateSalaryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_types do |t|
      t.string :name
      t.decimal :hourly_rate
      t.decimal :daily_rate
      t.decimal :overtime_rate

      t.timestamps
    end
  end
end
