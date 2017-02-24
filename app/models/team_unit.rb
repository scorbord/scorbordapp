class TeamUnit < ActiveRecord::Base
	belongs_to :team
	belongs_to :unit
	has_many :children_units, :through => :unit

	belongs_to :coach, class_name: 'PositionTeam', foreign_key: 'coach_position_team_id'
	has_many :position_teams
	has_many :positions, :through => :position_teams

	def all_position_teams(position_teams_array = [])
		all_positions = self.unit.all_positions
		all_positions.each do |pos|
			position_teams_array << self.team.position_teams.where('position_id = ?', pos.id).all
		end
		position_teams_array.flatten
	end

	def team_unit_child_coach_positions(team_unit_child_coach_positions_array = [])
		team_unit_child_coach_positions_array << PositionTeam.find(self.coach_position_team_id)
		if self.unit.unit_type == 'side'
			child_units = self.unit.children_units
			child_units.each do |child|
				team_unit_child_coach_positions_array << self.team.position_teams.where('position_id = ?', child.coach_position_id).all
			end
		end
		team_unit_child_coach_positions_array.flatten
	end

end
