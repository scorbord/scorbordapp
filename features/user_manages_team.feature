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