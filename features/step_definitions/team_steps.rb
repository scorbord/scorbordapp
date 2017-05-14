Given(/^the following team:$/) do |table|
	table.hashes.each do |attrs|
    Team.create!(attrs)
  end
end

Given(/^there is a Coach$/) do
	@person = Person.create(first_name:"Walter", last_name:"Sobchak", email:"walter@gmail.com", height: "76", weight: "280", gender: "1")
	@person.memberships.create(role: "coach", team_id: @team.id)
end

Given(/^there are (\d+) "(.*?)" members on the roster$/) do |num, position|
	num.to_i.times do
		@team.members.create(role: lower(position), first_name:"#{position}", email:"#{position}#{num}@gmail.com")
	end
end

Given(/^there is a Player$/) do
	@person = Person.create(first_name: "Theodore",
															 last_name: "Kerabatsos",
															 email: "donny@gmail.com",
															 height: "74",
															 weight: "185")
	@person.memberships.create(role: "player", team_id: @team.id, nickname: "Donny", grad_year: 2005)
end

Given(/^the player has a Contact$/) do
	@person.memberships.last.contacts.create(relation: 'Father', first_name: 'Just', last_name: 'Dad')
end
