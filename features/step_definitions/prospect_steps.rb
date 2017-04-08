Given(/^the "(.*?)" team has the following prospects:$/) do |team_name, table|
  @team = Team.find_by(name: team_name)
  table.hashes.each do |prospect|
    @team.prospects.create(prospect)
  end
end

Given(/^the prospect "(.*?)" has the following contacts:$/) do | prospect_name, table |
  @prospect = Prospect.find_by(first_name: prospect_name.split[0], last_name: prospect_name.split[1])
  table.hashes.each do |contact|
    @prospect.contacts.create(contact)
  end
end

Given(/^the prospect "(.*?)" has the following coaches:$/) do | prospect_name, table |
  @prospect = Prospect.find_by(first_name: prospect_name.split[0], last_name: prospect_name.split[1])
  table.hashes.each do |coach|
    @prospect.coaches.create(coach)
  end
end
