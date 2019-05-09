class ChangeAppointmentsTableName < ActiveRecord::Migration[5.0]
  def change 
    change_column :appointments, :user_id, :string
    change_column :appointments, :doctor_id, :string
  end
end