module SessionHelpers

def log_in_user(user)
    log_out
    visit(login_path)
    fill_in('Email address', with: user.email)
    fill_in('Password', with: 'password')
    #click_on('commit')
    click_button('Login')
  end

  def log_out
    Capybara.reset_sessions!
  end

end

Given(/^I am logged in as a user$/) do
  attrs = { first_name: 'Jeffrey', last_name: 'Lebowski', email: 'dude@gmail.com' }
  @user = find_or_create_user(attrs)
  log_in_user(@user)
end

Given(/^I am a user$/) do
  attrs = { first_name: 'Jeffrey', last_name: 'Lebowski', email: 'dude@gmail.com' }
  @user = find_or_create_user(attrs)
end

Given(/^I am logged in$/) do
  log_in_user(@user)
end

Given(/^I am logged in as a user with multiple teams$/) do
  attrs = { first_name: 'Jeffrey', last_name: 'Lebowski', email: 'dude@gmail.com' }
  @user = find_or_create_user(attrs)

  @school = School.create(name: "Abide High School", initials: "AHS", mascot: "Marmots")
  @program = @school.programs.create(sport: 1)
  @team = @program.teams.create(name: "The Hitters", sport: 1)
  TeamBuilder.new(@team).build_complete
  @member = @team.members.create(
                                  person_id: @user.people.first.id,
                                  admin: true,
                                  role: "coach",
                                )
  @program = @school.programs.create(sport: 2)
  @team = @program.teams.create(name: "The Kickers", sport: 2)
  TeamBuilder.new(@team).build_complete
  @member = @team.members.create(
                                  person_id: @user.people.first.id,
                                  admin: true,
                                  role: "coach",
                                )
  log_in_user(@user)
end

Given(/^I am logged in as a SuperAdmin$/) do
  attrs = { first_name: 'Jackie', last_name: 'Treehorn', email: 'jackie@treehornprod.com' }
  allow(Rails.configuration).to receive(:admins).and_return([attrs[:email]])
  @user = find_or_create_user(attrs)
  log_in_user(@user)
end

Given(/^I have a (.*?) team named "(.*?)"$/) do |sport, name|
  @school = School.create(name: "Abide High School", initials: "AHS", mascot: "Marmots")
  @program = @school.programs.create(sport: 1)
  @team = @program.teams.create(name: name, sport: sport)
  TeamBuilder.new(@team).build_complete
  @member = @team.members.create(
    person_id: @user.people.first.id,
                                  admin: true,
                                  role: "coach"
                                )

end

Given(/^I belong to a (.*?) team named "(.*?)"$/) do |sport, name|
  @school = School.create(name: "Abide High School", initials: "AHS", mascot: "Marmots")
  @program = @school.programs.create(sport: 1)
  @team = @program.teams.create(name: name, sport: sport)
  TeamBuilder.new(@team).build_complete
  @member = @team.members.create(
    person_id: @user.people.first.id,
                                  admin: false,
                                  role: "coach"
                                )

end

Given(/^I have the following teams:$/) do |table|
  table.hashes.each do |attrs|
    @school = School.create(name: "Abide High School", initials: "AHS", mascot: "Marmots")
    @program = @school.programs.create(sport: attrs['sport'])
    @team = @program.teams.create(name: attrs['name'], sport: @program[:sport])
    TeamBuilder.new(@team).build_complete
    @member = @team.members.create(
      person_id: @user.people.first.id,
      admin: true,
      role: 0)
  end
end

When(/^I logout$/) do
  log_out
end

Given(/^I am not logged in$/) do
  log_out
end

World(SessionHelpers)
