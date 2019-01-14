class CreateDayTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :day_types do |t|
      t.boolean :regular
      t.date :date_created
      t.integer :user_id

      t.timestamps
    end
  end
end
