class ProspectsController < ApplicationController

  def index
    @prospects = current_team.prospects
  end

  def new
    @prospect = current_team.prospects.new
  end

  def edit
    @prospect = Prospect.find(params[:id])
  end

  def create
    @prospect = current_team.prospects.new(prospect_params)
    if @prospect.save
      redirect_to @prospect
    else
      render 'new'
    end
  end

  def show
    @prospect = Prospect.find(params[:id])
  end

  def update
    @prospect = Prospect.find(params[:id])
    if @prospect.update_attributes(prospect_params)
      redirect_to @prospect
    else
      render :edit
    end
  end

  private

    def prospect_params
      params.require(:prospect).permit(
        :first_name,
        :last_name,
        :nickname,
        :email,
        :hs_grad_year,
        :cell_phone,
        :twitter,
        :facebook,
        :instagram,
        :snapchat,
        :home_city,
        :home_state,
        :intended_major,
        :club_team_name,
        :club_team_city,
        :club_team_state,
        :high_school_name,
        :high_school_city,
        :high_school_state,
        :notes,
        :birthday,
        :dominant_foot,
        :position
      )
    end
end
