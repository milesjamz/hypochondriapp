class User < ApplicationRecord
  has_many :conditions

  def random_condition
    Condition.all.sample[:CONDITION]
  end

  def find_doctors(location, age, gender)

  end
end
