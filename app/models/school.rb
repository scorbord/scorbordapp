class School < ActiveRecord::Base
	has_many :programs
	has_many :teams, through: :programs
	has_many :members, through: :teams
	has_many :users, through: :members
end
