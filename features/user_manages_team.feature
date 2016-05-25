Feature: User manages team
	
	Scenario: User adds a new team
		Given I am logged in as a user
		And I view my account
		When I click "Create a team"
		And I fill in "Team Name" with "The Rollers"
		And I fill in "Sport" with "Bowling"
		And I press "Create Team"
		Then I see "The Rollers"
		And I see "Sport: Bowling"

	Scenario: User edits a team
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I view my account
		And I click "edit" in the "The Rollers" card menu
		And I fill in "Team Name" with "Teh LOLers"
		And I fill in "Sport" with "Bawling"
		When I press "Save"
		Then I see "edit" in the "Teh LOLers" card menu
		And I see "Bawling"
		
	Scenario: User sees blank slate when he has no teams
		Given I am logged in as a user
		When I view my account
		Then I see "you don't have any teams"

	Scenario: User views a list of all his teams
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I have a Golf team named "The Swingers"
		When I view my account
		Then I see "The Rollers"
		And I see "The Swingers"

	Scenario: User views a team
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I am viewing my account
		When I click "View Team" in the "The Rollers" card actions
		Then I see "The Rollers Bowling > Roster"

	Scenario: User deletes a team
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I am viewing my account
		And I see "The Rollers"
		And I click "edit" in the "The Rollers" card menu
		When I click "Delete this team"
		Then I am taken to my account page
		And I see "Team successfully deleted"
		And I do not see "The Rollers"

	Scenario: Team owner adds a Coach
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I visit the roster page for "The Rollers"
		When I click "Add a Coach"
		And I fill in "First Name" with "Walter"
		And I fill in "Last Name" with "Sobchak"
		And I fill in "Nickname" with "Walt"
		And I fill in "Email Address" with "walter@gmail.com"
		And I fill in "Cell Phone" with "4267655464"
		And I fill in "Height" with "75"
		And I fill in "Weight" with "250"
		And I fill in "Gender" with "Male"
		And I fill in "Graduation Year" with "1969"
		And I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "Sobchak Walter" in the "Coaches" section

	Scenario: Team owner adds a Player
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And I visit the roster page for "The Rollers"
		When I click "Add a Player"
		And I fill in "First Name" with "Theodore"
		And I fill in "Last Name" with "Kerabatsos"
		And I fill in "Nickname" with "Donny"
		And I fill in "Email Address" with "donny@gmail.com"
		And I fill in "Cell Phone" with "4267655464"
		And I fill in "Height" with "70"
		And I fill in "Weight" with "180"
		And I fill in "Gender" with "Male"
		And I fill in "Graduation Year" with "1969"
		And I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "Kerabatsos Theodore" in the "Players" section

	#@javascript
	Scenario: Team owner removes a Coach from the Team
		Given I am logged in as a user
		And I have a Bowling team named "The Rollers"
		And there is a Coach
		And I visit the roster page for "The Rollers"
		And I click "Profile" in the "Sobchak" row
		And I click "edit"
		When I click "Delete this team member"
		Then I do not see "Sobchak" in the "Coaches" section