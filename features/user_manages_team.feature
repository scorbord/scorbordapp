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
		




#	Scenario: User views his teams
#		Given I am logged in as a user
#		And the following team:
#			| name 				| sport 	|
#			| The Rollers | Bowling |
