Given(/^the following team:$/) do |table|
	table.hashes.each do |attrs|
    Team.create!(attrs)
  end
end

Given(/^there is a Coach$/) do
	@team.members.create(role: "Coach", first_name:"Walter", last_name:"Sobchak", email:"walter@gmail.com")
end

Given(/^there are (\d+) "(.*?)" members on the roster$/) do |num, position|
	num.to_i.times do
		@team.members.create(role: position, first_name:"#{position}", email:"#{position}#{num}@gmail.com")
	end
end