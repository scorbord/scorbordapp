class CreateTeamUnitTable < ActiveRecord::Migration
  def change
    create_table :team_units do |t|
      t.integer :team_id
      t.integer :unit_id
      t.integer :coach_position_team_id

      t.timestamps
    end
  end
end
