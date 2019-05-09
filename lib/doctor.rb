class Investigator < ActiveRecord::Base
has_many :appointments
has_many :users, through: :appointments

	def self.random_investigator
		Investigator.all.shuffle[0].name
	end



end