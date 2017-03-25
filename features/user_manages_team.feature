#@seed
@football-seed
Feature: User manages team
	
	Scenario: User adds a new team
		Given I am logged in as a user
		And I view my account
		When I click "Add a team"
		And I fill in "Team Name" with "The Rollers"
		And I fill in "Sport" with "Football"
		And I press "Create Team"
		Then I see "The Rollers"
		And I see "Football"

	Scenario: User sees blank slate when he has no teams
		Given I am logged in as a user
		When I view my account
		Then I see "you don't have any teams"

	Scenario: User views a list of all his teams
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And I have a Soccer team named "The Swingers"
		When I view my account
		Then I see "The Rollers"
		And I see "The Swingers"

	Scenario: User views a team
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And I am viewing my account
		When I click "launch" inside the "The Rollers" list item
		Then I am on the team show page for "The Rollers"
		Then I see "Dashboard"

	Scenario: Team owner adds a Coach
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And I visit the roster page for "The Rollers"
		And I click "supervisor_account"
		And I fill in "First Name" with "Walter"
		And I fill in "Last Name" with "Sobchak"
		And I fill in "Nickname" with "Walt"
		And I fill in "Email Address" with "walter@gmail.com"
		And I fill in "Cell Phone" with "4267655464"
		And I select the "Male" radio button
		And I select the "OC" checkbox
		And I select the "OL" checkbox
		When I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "Sobchak"
		And I see "walter@gmail.com"
		And I see "OC" in the "Sobchak" row within the "coaches-panel" panel
		And I see "OL" in the "Sobchak" row within the "coaches-panel" panel

	Scenario: NonAdmin User cannot add someone to team
		Given I am logged in as a user
		And I belong to a Soccer team named "The Kickers"
		When I visit the roster page for "The Kickers"
		Then I do not see "add"

	Scenario: NonAdmin User cannot remove someone from team
		Given I am logged in as a user
		And I belong to a Soccer team named "The Kickers"
		And there is a Player
		When I visit the roster page for "The Kickers"
		And I click "edit" in the "players-panel" div
		Then I do not see "Delete"

	Scenario: Team owner adds a Player
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And I visit the roster page for "The Rollers"
		When I click "person"
		And I fill in "First Name" with "Theodore"
		And I fill in "Last Name" with "Kerabatsos"
		And I fill in "Nickname" with "Donny"
		And I fill in "Email Address" with "donny@gmail.com"
		And I fill in "Cell Phone" with "4267655464"
		And I fill in "Jersey Number" with "75"
		And I fill in "Height (ft.)" with "5"
		And I fill in "(in.)" with "10"
		And I fill in "Weight" with "180"
		And I select the "Male" radio button
		And I fill in "Graduation Year" with "1969"
		And I select the "RB" checkbox
		And I select the "DE" checkbox
		And I select the "LS" checkbox
		And I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "donny@gmail.com"
		And I see "Kerabatsos" in the "players-panel" div
		And I see "Theodore" in the "players-panel" div
		And I see "RB" in the "Kerabatsos" row within the "players-panel" panel
		And I see "DE" in the "Kerabatsos" row within the "players-panel" panel
		And I see "LS" in the "Kerabatsos" row within the "players-panel" panel
		And I see "75" in the "Kerabatsos" row within the "players-panel" panel

	Scenario: Team owner removes a Coach from the Team
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Coach
		And I visit the roster page for "The Rollers"
		And I click "edit" inside the first "Sobchak" row
		When I click "Delete this Coach"
		Then I do not see "Sobchak"

	Scenario: Team admin cannot remove himself from the Team
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And I visit the roster page for "The Rollers"
		And I click "edit" inside the first "Lebowski" row
		Then I do not see "Delete"

	Scenario: Team owner removes a Player from the Team
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Player
		And I visit the roster page for "The Rollers"
		And I click "edit" inside the first "Kerabatsos" row
		When I click "Delete this Player"
		Then I do not see "Kerabatsos"

	Scenario: Team owner views a Player Profile
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Player
		And I visit the roster page for "The Rollers"
		When I click "view" inside the first "Kerabatsos" row
		Then I see "The Rollers > Theodore Kerabatsos (Player)"

	Scenario: Team owner views a Coach Profile
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Coach
		And I visit the roster page for "The Rollers"
		When I click "view" inside the first "Sobchak" row
		Then I see "The Rollers > Walter Sobchak (Coach)"

	Scenario: Team owner edits a Player's Profile
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Player
		And I visit the roster page for "The Rollers"
		When I click "edit" inside the first "Kerabatsos" row
		Then I see "Edit Player"
		And I do not see "edit"
		When I fill in "First Name" with "newfirstname"
		And I select the "QB" checkbox
		And I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "Kerabatsos newfirstname QB" in the "players-panel" div
	
	Scenario: Team owner edits a Coach's Profile
		Given I am logged in as a user
		And I have a Football team named "The Rollers"
		And there is a Coach
		And I visit the roster page for "The Rollers"
		When I click "edit" inside the first "Sobchak" row
		Then I see "Edit Coach"
		And I do not see "edit"
		When I fill in "First Name" with "someothername"
		And I select the "DC" checkbox
		And I select the "DL" checkbox
		And I press "Save"
		Then I am taken to the roster page for "The Rollers"
		And I see "Sobchak someothername" in the "coaches-panel" div
		And I see "DC" in the "Sobchak" row within the "coaches-panel" panel	
		And I see "DL" in the "Sobchak" row within the "coaches-panel" panel	
