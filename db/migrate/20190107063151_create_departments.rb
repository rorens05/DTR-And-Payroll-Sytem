class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :manager
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
