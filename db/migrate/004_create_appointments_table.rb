class CreateAppointmentsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.datetime :date
    end
  end
end