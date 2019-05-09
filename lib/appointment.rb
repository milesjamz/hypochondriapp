class Appointment < ActiveRecord::Base
belongs_to :users
belongs_to :investigators

end