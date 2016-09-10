module DataFixtures

  def self.positions
    [
      { name: 'Quarterback',initials: 'QB',side: 1,sport: 1 },
      { name: 'Running Back',initials: 'RB',side: 1,sport: 1 },
      { name: 'Tight End',initials: 'TE',side: 1,sport: 1 },
      { name: 'Defensive Tackle',initials: 'DT',side: 2,sport: 1 },
      { name: 'Defensive End',initials: 'DE',side: 2,sport: 1 },
      { name: 'Kicker',initials: 'K',side: 3,sport: 1 }
    ]
  end

end
