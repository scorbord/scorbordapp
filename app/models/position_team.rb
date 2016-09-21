class PositionTeam < ActiveRecord::Base
	belongs_to :team
	belongs_to :position
	belongs_to :team_unit
	has_one :unit, :through => :team_unit
	has_many :member_position_teams
	has_many :members, :through => :member_position_teams

	def name
		self.position.name
	end

	def initials
		self.position.initials
	end

	def side
		self.position.side
	end

	def self.side(int)
		joins(:position).where("positions.side = #{int}")
	end

end
