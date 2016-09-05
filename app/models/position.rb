class Position < ActiveRecord::Base
	has_many :position_teams
	has_many :teams, :through => :position_teams

end
