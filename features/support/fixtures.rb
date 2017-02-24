module DataFixtures

  def self.football_offensive_coordinator_position
    [
      { name: 'Offensive Coordinator', initials: 'OC', position_type: 'coach', sport: 'football', side: 'offense'}
    ]
  end

  def self.football_offensive_unit
    [
      { name: 'Offense', initials: 'O', unit_type: 'side' }
    ]
  end

  def self.football_offensive_coach_positions
    [
      { name: 'Quarterbacks', initials: 'QBs'},
      { name: 'Running Backs', initials: 'RBs'},
      { name: 'Tight Ends', initials: 'TEs'},
      { name: 'Wide Receivers', initials: 'WRs'},
      { name: 'Offensive Line', initials: 'OL'}
    ]
  end

  def self.football_offensive_position_units
    [
      { name: 'Quarterback', initials: 'QB', coach_name: 'Quarterbacks'},
      { name: 'Running Back', initials: 'RB', coach_name: 'Running Backs'},
      { name: 'Wide Receiver', initials: 'WR', coach_name: 'Wide Receivers'},
      { name: 'Tight End', initials: 'TE', coach_name: 'Tight Ends'},
      { name: 'Offensive Line', initials: 'OL', coach_name: 'Offensive Line'}
    ]
  end

  def self.football_offense_player_positions
    [
      { name: 'Quarterback', initials: 'QB', find_unit: 'QB'},
      { name: 'Running Back', initials: 'RB', find_unit: 'RB'},
      { name: 'Fullback', initials: 'FB', find_unit: 'RB'},
      { name: 'Tight End', initials: 'TE', find_unit: 'TE'},
      { name: 'Wide Receiver', initials: 'WR', find_unit: 'WR'},
      { name: 'Offensive Tackle', initials: 'OT', find_unit: 'OL'},
      { name: 'Offensive Guard', initials: 'OG', find_unit: 'OL'},
      { name: 'Center', initials: 'C', find_unit: 'OL'}
    ]
  end

  def self.football_defensive_coordinator_position
    [
      { name: 'Defensive Coordinator', initials: 'DC', position_type: 'coach', sport: 'football', side: 'defense'}
    ]
  end

  def self.football_defensive_unit
    [
      { name: 'Defense', initials: 'D', unit_type: 'side' }
    ]
  end

  def self.football_defensive_coach_positions
    [
      { name: 'Defensive Line', initials: 'DL'},
      { name: 'Defensive Ends', initials: 'DEs'},
      { name: 'Linebackers', initials: 'LBs'},
      { name: 'Inside Linebackers', initials: 'ILBs'},
      { name: 'Outside Linebackers', initials: 'OLBs'},
      { name: 'Defensive Backs', initials: 'DBs'},
      { name: 'Cornerbacks', initials: 'CBs'},
      { name: 'Safeties', initials: 'S'}
    ]
  end

  def self.football_defensive_position_units
    [
      { name: 'Defensive Line', initials: 'DL', coach_name: 'Defensive Line'},
      { name: 'Linebacker', initials: 'LB', coach_name: 'Linebackers'},
      { name: 'Defensive Back', initials: 'DB', coach_name: 'Defensive Backs'}
    ]
  end

  def self.football_defense_player_positions
    [
      { name: 'Defensive Tackle', initials: 'DT', find_unit: 'DL'},
      { name: 'Defensive End', initials: 'DE', find_unit: 'DL'},
      { name: 'Inside Linebacker', initials: 'ILB', find_unit: 'LB'},
      { name: 'Outside Linebacker', initials: 'OLB', find_unit: 'LB'},
      { name: 'Middle Linebacker', initials: 'MLB', find_unit: 'LB'},
      { name: 'Strongside Linebacker', initials: 'SLB', find_unit: 'LB'},
      { name: 'Weakside Linebacker', initials: 'WLB', find_unit: 'LB'},
      { name: 'Cornerback', initials: 'CB', find_unit: 'DB'},
      { name: 'Strong Safety', initials: 'SS', find_unit: 'DB'},
      { name: 'Free Safety', initials: 'FS', find_unit: 'DB'}
    ]
  end

  def self.football_specialteams_unit
    [
      { name: 'Special Teams', initials: 'ST', unit_type: 'side' }
    ]
  end

  def self.football_specialteams_coordinator_position
    [
      { name: 'Special Teams Coordinator', initials: 'STC', position_type: 'coach', sport: 'football', side: 'special_teams'}
    ]
  end

  def self.football_specialteams_coach_positions
    [
      { name: 'Kickers', initials: 'Ks'},
      { name: 'Punters', initials: 'Ps'},
      { name: 'Long Snappers', initials: 'LSs'},
      { name: 'Kick Returners', initials: 'KRs'},
      { name: 'Kickoff Team Coach', initials: 'KO'},
      { name: 'Kick Return Coach', initials: 'KR'},
      { name: 'Punt Team Coach', initials: 'PT'},
      { name: 'Punt Return Team Coach', initials: 'PR'},
      { name: 'Field Goal Team Coach', initials: 'FGTC'},
      { name: 'Field Goal Block Team Coach', initials: 'FGTC'}
     ]
  end

  def self.football_specialteams_position_units
    [
      { name: 'Kickoff', initials: 'KOT', coach_name: 'Kickoff Team Coach'},
      { name: 'Kick Return', initials: 'KRT', coach_name: 'Kick Return Coach'},
      { name: 'Punt Team', initials: 'PT', coach_name: 'Punt Team Coach'},
      { name: 'Punt Return', initials: 'PRT', coach_name: 'Punt Return Team Coach'},
      { name: 'Field Goal', initials: 'FGT', coach_name: 'Field Goal Team Coach'},
      { name: 'Field Goal Block', initials: 'FGBT', coach_name: 'Field Goal Block Team Coach'}
    ]
  end

  def self.football_specialteams_player_positions
    [
      { name: 'Kicker', initials: 'K', find_unit: 'KOT'},
      { name: 'Kickoff Gunner', initials: 'KOG', find_unit: 'KOT'},
      { name: 'Kick Returner', initials: 'KR', find_unit: 'KRT'},
      { name: 'Kick Return Jammer', initials: 'KRJ', find_unit: 'KRT'},
      { name: 'Long Snapper', initials: 'LS', find_unit: 'PT'},
      { name: 'Punter', initials: 'P', find_unit: 'PT'},
      { name: 'Upback', initials: 'UB', find_unit: 'PT'},
      { name: 'Punt Gunner', initials: 'PG', find_unit: 'PT'},
      { name: 'Punt Returner', initials: 'PR', find_unit: 'PRT'},
      { name: 'Punt Return Jammer', initials: 'PRJ', find_unit: 'PRT'},
      { name: 'Snapper', initials: 'SN', find_unit: 'FGT'},
      { name: 'Holder', initials: 'H', find_unit: 'FGT'},
      { name: 'Placekicker', initials: 'PK', find_unit: 'FGT'},
      { name: 'Field Goal Jammer', initials: 'FGJ', find_unit: 'FGT'},
      { name: 'Field Goal Block Gunner', initials: 'FGBG', find_unit: 'FGBT'}
    ]
  end


end
