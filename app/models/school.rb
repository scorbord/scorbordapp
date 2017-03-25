class School < ActiveRecord::Base
	has_many :teams
	has_many :members, through: :teams
	has_many :users, through: :members
end
