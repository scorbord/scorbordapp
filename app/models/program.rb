class Program < ActiveRecord::Base
	enum sport: {
		Football: 1,
		Basketball: 2
	}
	belongs_to :school
	has_many :teams
end
