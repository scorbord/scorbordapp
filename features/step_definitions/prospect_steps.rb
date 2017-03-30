Given(/^the "(.*?)" team has the following prospects:$/) do |team_name, table|
  @team = Team.find_by(name: team_name)
  table.hashes.each do |prospect|
    @team.prospects.create(prospect)
  end
end
