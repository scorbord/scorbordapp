class PositionTeam < ActiveRecord::Base
	belongs_to :team
	belongs_to :position

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
