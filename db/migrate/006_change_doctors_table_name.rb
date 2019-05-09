class ChangeDoctorsTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :doctors, :investigators
  end 
end