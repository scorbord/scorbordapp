Given(/^the following team:$/) do |table|
	table.hashes.each do |attrs|
    Team.create!(attrs)
  end
end

Given(/^there is a Coach$/) do
	@user = User.create(first_name:"Walter", last_name:"Sobchak", email:"walter@gmail.com", password: "password", password_confirmation: "password")
	@user.person = Person.create(first_name:"Walter", last_name:"Sobchak", email:"walter@gmail.com", height: "76", weight: "280", gender: "1")
	@user.person.memberships.create(role: "Coach", team_id: @team.id)
end

Given(/^there are (\d+) "(.*?)" members on the roster$/) do |num, position|
	num.to_i.times do
		@team.members.create(role: position, first_name:"#{position}", email:"#{position}#{num}@gmail.com")
	end
end

Given(/^there is a Player$/) do
	@user = User.create!(first_name: "Theodore",
											last_name: "Kerabatsos",
											email: "donny@gmail.com",
											password: "password",
											password_confirmation: "password")
	@user.person = Person.create(first_name: "Theodore",
															 last_name: "Kerabatsos",
															 email: "donny@gmail.com",
															 height: "74",
															 weight: "185")
	@user.person.memberships.create(role: "Player", team_id: @team.id)
end
