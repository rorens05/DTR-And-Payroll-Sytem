class CreateDeductionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :deduction_details do |t|
      t.string :name
      t.decimal :percentage
      t.decimal :fixed_deduction

      t.timestamps
    end
  end
end
