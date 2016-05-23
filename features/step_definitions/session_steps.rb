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


#Given(/^I am logged in as a user and I have the following team:$/) do |table|
#  usrattrs = { first_name: 'Jeffrey', last_name: 'Lebowski', email: 'dude@gmail.com' }
#  @user = find_or_create_user(usrattrs)
#  @team = @user.teams.create!(table.rows_hash)
#  log_in_user(@user)
#end

Given(/^I have the following team:$/) do |table|
  @user.teams.create()
end

Given(/^I have a (.*?) team named "(.*?)"$/) do |sport, name|
  #@user = find_or_create_user(first_name: 'Jeffrey', last_name: 'Lebowski', email: 'dude@gmail.com')
  @team = @user.teams.create(name: name, sport: sport)
end

When(/^I logout$/) do
  log_out
end

World(SessionHelpers)