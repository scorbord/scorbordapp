class AddTeamUnitIdToPositionTeam < ActiveRecord::Migration
  def change
    add_column :position_teams, :team_unit_id, :integer
  end
end
