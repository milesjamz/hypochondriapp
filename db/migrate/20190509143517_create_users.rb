class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :health
      t.string :condition
      t.timestamps
    end
  end
end
