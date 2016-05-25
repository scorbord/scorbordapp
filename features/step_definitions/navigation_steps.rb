Given(/^I (?:view|am viewing) my account$/) do
  visit(user_path(@user))
end

Given(/^I (?:visit|go to) the roster page for "(.*?)"$/) do |team_name|
  visit(team_path(Team.find_by!(name: team_name)))
end

Given(/^I am (?:on|taken to) the roster page for "(.*?)"$/) do |team_name|
	expect(current_path).to eq(team_path(Team.find_by!(name: team_name)))
end

Then(/^I am viewing the customer page for "(.*?)"$/) do |email|
  expect(current_path).to eq(customer_path(Customer.find_by!(email: email)))
end

Given(/^I visit the organization page for "(.*?)"$/) do |name|
  visit(admin_organization_path(Organization.find_by!(name: name)))
end
