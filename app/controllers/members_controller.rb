class MembersController < ApplicationController

	def new
		@member = Team.find_by(params[:id]).members.new
	end

	def create
		@team = Team.find(params[:team_id])
		@member = @team.members.new(member_params)
		@member.height = (params[:member][:heightft].to_i)*12 + (params[:member][:heightin].to_i)
		if @member.save
			redirect_to team_roster_path(@team)
		else
			render 'new'
		end
	end

	def index
		@team = Team.find(params[:team_id])
		@members = @team.members.order(:last_name)
		@coaches = @members.where(:role => 'Coach').order(:last_name)
		@players = @members.where(:role => 'Player').order(:last_name)
		@member = @members.order(:last_name).first
	end

	def show
		@member = Member.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def edit
		@member = Member.find(params[:id])
		if @member.height
			@member.heightft = @member.height / 12
			@member.heightin = @member.height % 12
		end
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

end
