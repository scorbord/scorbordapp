class MembersController < ApplicationController

	def schedule
		@team = current_team
	end

	def schedulev2
		@team = current_team
	end

	def new
		@team = current_team
		@person = Person.new
		@member = @person.memberships.new(team_id: params[:id])
		@sides = @team.sides.order(:unit_id)
		if params[:role] == 'coach'
			@positions = @team.position_teams.joins(:position).where('position_type = 1')
		elsif params[:role] == 'player'
			@positions = @team.position_teams.joins(:position).where('position_type = 2')
		end
	end

	def index
		@team = current_team
		@members = @team.members.joins(:person).order('people.last_name')
		@coaches = @members.where(role: 0) #.joins(:person).order('people.last_name')
		@players = @members.where(role: 1) #.joins(:person).order('people.last_name')
	end

	def index2
		@team = current_team
		@members = @team.members.joins(:person).order('people.last_name')
	end

	def show
		@member = Member.find(params[:id])
		@person = @member.person
		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit
		@member = Member.find(params[:id])
		@team = @member.team
		@person = @member.person
		if @person.height
			@person.heightft = @person.height / 12
			@person.heightin = @person.height % 12
		end
		@sides = @team.sides
		if @member.role == 'coach'
			@positions = @team.position_teams.joins(:position).where('position_type = 0')
		elsif @member.role == 'player'
			@positions = @team.position_teams.joins(:position).where('position_type = 1')
		end
		@offpos = @positions.side(1)
		@defpos = @positions.side(2)
		@stpos = @positions.side(3)
	end

	def create
		@person = Person.find_or_initialize_by(person_params)
		if @person.save
			@member = @person.memberships.new(member_params)
			@member.team = current_team
			if @member.save
				redirect_to roster_path
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def update
		@member = Member.find(params[:id])
		@person = @member.person
		if @person.update_attributes(person_params)
			if @member.update_attributes(member_params)
				redirect_to roster_path
			else
				render 'edit'
			end
		else
			render 'edit'
		end
	end

	def destroy
		Member.find(params[:id]).destroy
		flash[:success] = "Team member removed"
		redirect_to team_roster_path(params[:team_id])
	end

	private

		def member_params
			params.require(:member).permit(:nickname, :role, :cell_phone, :admin, :grad_year, :jersey_number, position_team_ids: [])
		end

		def person_params
			{
				first_name: params[:member][:person][:first_name],
				last_name: params[:member][:person][:last_name],
				email: params[:member][:person][:email],
				height: params[:member][:person][:heightft].to_i*12 + params[:member][:person][:heightin].to_i,
				weight: params[:member][:person][:weight],
				gender: params[:member][:person][:gender],
			}
		end
end
