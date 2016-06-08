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

Given(/^I have a (.*?) team named "(.*?)"$/) do |sport, name|
  @team = Team.create(name: name, sport: sport)
  @member = @team.members.create(
                                  user_id: @user.id,
                                  admin: true,
                                  role: "Coach",
                                  first_name: @user.first_name,
                                  last_name: @user.last_name,
                                  email: @user.email
                                )
end

When(/^I logout$/) do
  log_out
end

Given(/^I am not logged in$/) do
  log_out
end

World(SessionHelpers)
