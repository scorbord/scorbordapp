Feature: User manages account

	Scenario: User views account
		Given I am logged in as a user
		When I click "Account"
		Then I see "Account Details"
		And I see "Jeffrey Lebowski"
		And I see "dude@gmail.com"
		And I see "Edit Account"

	Scenario: User edits account
		Given I am logged in as a user
		And I click "Account"
		And I click "Edit Account"
		And I fill in "First Name" with "The Dude"
		And I fill in "Last Name" with "Abides"
		When I press "Save"
		Then I see "The Dude Abides"

#	Scenario: User changes password
#		Given I am logged in as a user
#		And I click "Account"
#		And I click "Edit Account"


