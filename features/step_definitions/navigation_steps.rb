Given(/^I (?:view|am viewing) my account$/) do
  visit(profile_path)
end

Given(/^I (?:visit|go to) the roster page for "(.*?)"$/) do |team_name|
  visit(roster_path)
end

Given(/^I am (?:on|taken to) the roster page for "(.*?)"$/) do |team_name|
  expect(current_path).to eq(roster_path)
end

Given(/^I am (?:on|taken to) the team show page for "(.*?)"$/) do |team_name|
	expect(current_path).to eq(team_path(Team.find_by!(name: team_name)))
end

Given(/^I visit the school show page for "(.*?)"$/) do |school_name|
	visit(admin_school_path(School.find_by!(name: school_name)))
end

Given(/^I am (?:on|taken to) the school show page for "(.*?)"$/) do |school_name|
	expect(current_path).to eq(admin_school_path(School.find_by!(name: school_name)))
end

Then(/^I am viewing the customer page for "(.*?)"$/) do |email|
  expect(current_path).to eq(customer_path(Customer.find_by!(email: email)))
end

Given(/^I visit the organization page for "(.*?)"$/) do |name|
  visit(admin_organization_path(Organization.find_by!(name: name)))
end

Then(/^I am viewing the redeem page for the invitation$/) do
  expect(current_path).to eq(invitation_redeem_path(@inv.token))
end

Given(/^I am viewing the recruiting page$/) do
  visit(prospects_path)
end
