class Study < ApplicationRecord
  self.table_name = "studies"
  belongs_to :condition,
    class_name: :Condition,
    foreign_key: :NCT_ID,
    primary_key: :id_condition
  has_many :investigators
end