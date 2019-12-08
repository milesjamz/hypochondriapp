class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string   "user_id"
      t.string   "doctor_id"
      t.datetime "date"
      t.timestamps
    end
  end
end
