Before('@football-seed') do

  #create OFFENSE Unit
  offense_unit = Unit.find_or_initialize_by(DataFixtures.football_offensive_unit.first)
  #create and assign OFF COORD Position as Coach
  offense_unit.coach_position_id = Position.find_or_create_by!(DataFixtures.football_offensive_coordinator_position.first)[:id]
  #save the OFFENSE Unit
  offense_unit.save

  #create Coach Positions
  DataFixtures.football_offensive_coach_positions.each do |ocp_attrs|
    ocp_attrs.merge!({:position_type => 'coach', :sport => 'football', :side => 'offense'})
    Position.find_or_create_by!(ocp_attrs)
  end

  #create Child Offensive Units
  DataFixtures.football_offensive_position_units.each do |opu_attrs|
    coach_pos_id = Position.find_by(name: opu_attrs[:coach_name]).id
    opu_attrs.merge!(parent_unit_id: offense_unit.id, coach_position_id: coach_pos_id, unit_type: 'position_unit')
    opu_attrs.delete(:coach_name)
    Unit.create!(opu_attrs)
  end

  #create OFFENSE Positions and assign to units
  DataFixtures.football_offense_player_positions.each do |opp_attrs|
    unit_id = Unit.find_by(initials: opp_attrs[:find_unit]).id
    opp_attrs.merge!(unit_id: unit_id, side: 'offense', position_type: 'player', sport: 'football')
    opp_attrs.delete(:find_unit)
    Position.create!(opp_attrs)
  end


  #create DEFENSE Unit
  defense_unit = Unit.find_or_initialize_by(DataFixtures.football_defensive_unit.first)
  #create and assign DEF COORD Position as Coach
  defense_unit.coach_position_id = Position.find_or_create_by!(DataFixtures.football_defensive_coordinator_position.first)[:id]
  #save the DEFENSE Unit
  defense_unit.save

  #create Defense Coach Positions
  DataFixtures.football_defensive_coach_positions.each do |dcp_attrs|
    dcp_attrs.merge!({:position_type => 'coach', :sport => 'football', :side => 'defense'})
    Position.find_or_create_by!(dcp_attrs)
  end

  #create Child Defensive Units
  DataFixtures.football_defensive_position_units.each do |dpu_attrs|
    coach_pos_id = Position.find_by(name: dpu_attrs[:coach_name]).id
    dpu_attrs.merge!(parent_unit_id: defense_unit.id, coach_position_id: coach_pos_id, unit_type: 'position_unit')
    dpu_attrs.delete(:coach_name)
    Unit.create!(dpu_attrs)
  end

  #create DEFENSE Positions and assign to units
  DataFixtures.football_defense_player_positions.each do |dpp_attrs|
    unit_id = Unit.find_by(initials: dpp_attrs[:find_unit]).id
    dpp_attrs.merge!(unit_id: unit_id, side: 'defense', position_type: 'player', sport: 'football')
    dpp_attrs.delete(:find_unit)
    Position.create!(dpp_attrs)
  end

  #create SPECIALTEAMS Unit
  st_unit = Unit.find_or_initialize_by(DataFixtures.football_specialteams_unit.first)
  #create and assign ST COORD Position as Coach
  st_unit.coach_position_id = Position.find_or_create_by!(DataFixtures.football_specialteams_coordinator_position.first)[:id]
  #save the ST Unit
  st_unit.save

  #create ST Coach Positions
  DataFixtures.football_specialteams_coach_positions.each do |stcp_attrs|
    stcp_attrs.merge!({:position_type => 'coach', :sport => 'football', :side => 'special_teams'})
    Position.find_or_create_by!(stcp_attrs)
  end

  #create Child ST Units
  DataFixtures.football_specialteams_position_units.each do |stpu_attrs|
    coach_pos_id = Position.find_by(name: stpu_attrs[:coach_name]).id
    stpu_attrs.merge!(parent_unit_id: st_unit.id, coach_position_id: coach_pos_id, unit_type: 'position_unit')
    stpu_attrs.delete(:coach_name)
    Unit.create!(stpu_attrs)
  end

  #create ST Positions and assign to units
  DataFixtures.football_specialteams_player_positions.each do |stpp_attrs|
    unit_id = Unit.find_by(initials: stpp_attrs[:find_unit]).id
    stpp_attrs.merge!(unit_id: unit_id, side: 'special_teams', position_type: 'player', sport: 'football')
    stpp_attrs.delete(:find_unit)
    Position.create!(stpp_attrs)
  end

end
