class User < ActiveRecord::Base
has_many :appointments
has_many :investigators, through: :appointments

	def my_appointments
	end

end