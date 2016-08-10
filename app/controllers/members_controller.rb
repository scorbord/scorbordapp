class MembersController < ApplicationController

	def new
		@person = Person.new
		@member = Team.find_by(params[:id]).members.new
	end

	def create
		@person = Person.find_or_initialize_by(person_params)
		if @person.save
			@member = @person.memberships.new(member_params)
			@member.team_id = params[:team_id]
			if @member.save
				redirect_to team_roster_path(params[:team_id])
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	def index
		@team = Team.find(params[:team_id])
		@members = @team.members.joins(:person).order('people.last_name')
		@coaches = @members.where(:role => 'Coach').joins(:person).order('people.last_name')
		@players = @members.where(:role => 'Player').joins(:person).order('people.last_name')
		@member = @members.joins(:person).order('people.last_name').first
	end

	def index2
		@team = Team.find(params[:team_id])
		@members = @team.members.joins(:user).order('users.last_name')
	end

	def show
		@member = Member.find(params[:id])
		@user = @member.user
		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit
		@member = Member.find(params[:id])
		@user = @member.user
	end

	def update
		@member = Member.find(params[:id])
		@member.height = (params[:member][:heightft].to_i)*12 + (params[:member][:heightin].to_i)
		if @member.update_attributes(member_params)
			redirect_to team_roster_path(@member.team)
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
			params.require(:member).permit(:first_name, :last_name, :nickname, :role, :email, :cell_phone, :admin, :gender, :height, :weight, :grad_year)
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
