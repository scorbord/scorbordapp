class CreateMemberPositionTeams < ActiveRecord::Migration
  def change
    create_table :member_position_teams do |t|
      t.integer :member_id
      t.integer :position_team_id
    end
  end
end
