class Illness < ActiveRecord::Base
has_many :users


		def self.random_illness
		Illness.all.shuffle[0].name
		end
end