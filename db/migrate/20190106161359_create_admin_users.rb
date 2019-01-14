class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :contact_no

      t.timestamps
    end
  end
end
