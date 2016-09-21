class TeamBuilder

	#initialize the object
	def initialize(team)
		@team = team
	end

	#initialize the object
#	def initialize(params)
#		@team = Team.create(name: params[:team][:name], program_id: params[:program_id])
#	end

	#callable method goes here!
	def build_complete
		begin
			build_position_teams
			build_team_units
			true
		rescue
			false
		end
	end

	private

		def build_position_teams
			@team.positions << Position.where(sport: @team.program[:sport])
		end

		def build_team_units

			#units where the coach_position_id is in the team's positions
			units = Unit.where(coach_position_id: @team.positions.pluck(:id))

			#loop thru units, create TeamUnit with proper coach_position_team_id and add children to that TeamUnit

			units.each do |unit|

				#create the team_unit and save it to a variable
				team_unit = @team.team_units.create(unit_id: unit.id, coach_position_team_id: @team.position_teams.where('position_id = ?', unit.coach_position_id).pluck(:id).first)

				#add positions to the team_unit
				team_unit.position_teams << @team.position_teams.where(position_id: unit.positions.pluck(:id))

			end
		end

end
