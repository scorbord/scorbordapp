class School < ActiveRecord::Base
	has_many :programs
	has_many :teams, through: :programs
end
