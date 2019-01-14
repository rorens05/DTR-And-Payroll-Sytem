class CreateLeaveDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_details do |t|
      t.string :name
      t.boolean :is_payed
      t.integer :number_of_days

      t.timestamps
    end
  end
end
