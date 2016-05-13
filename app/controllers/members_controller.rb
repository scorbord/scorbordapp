class MembersController < ApplicationController

	def new
		@member = Team.find_by(params[:id]).members.new
	end

	def create
		@team = Team.find(params[:team_id])
		@member = @team.members.new(member_params)
		if @member.save
			redirect_to @team
		else
			render 'new'
		end
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update_attributes(member_params)
			redirect_to @member.team
		else
			render 'edit'
		end
	end

	def destroy
		Member.find(params[:id]).destroy
		flash[:success] = "Team member removed"
		redirect_to team_path(params[:team_id])
	end

	private

		def member_params
			params.require(:member).permit(:first_name, :middle_name, :last_name, :role, :email)
		end

end