Feature: Coach manages recruiting prospects

	Scenario: Coach views list of prospects for his team
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		When I visit the prospects page
		Then I see "Landon" in the "Donovan" row
		And I see "Freddy" in the "Adu" row
	
	Scenario: Coach adds a prospect for his team
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And I visit the prospects page
		When I click "add"
		And I fill in "First Name" with "Alexi"
		And I fill in "Last Name" with "Lalas"
		And I press "Save"
		Then I see "Prospects > Alexi Lalas"

	Scenario: Coach views a prospect for his team
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		When I click "view" in the "Donovan" row
		Then I see "Prospects > Landon Donovan"

	Scenario: Coach edits a prospect for his team
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "edit"
		And I fill in "Last Name" with "Donovante"
		And I press "Save"
		Then I see "Prospects > Landon Donovante"

	Scenario: NonCoachAdmin can view/manage prospects
		Given I am a user
		And I belong to a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		Given I am logged in
		When I click "Prospects"
		Then I see "Freddy" in the "Adu" row
		And I see "Landon" in the "Donovan" row
		And I see "edit" in the "Adu" row
		And I see "edit" in the "Donovan" row

	Scenario: NonCoach NonAdmin cannot view/manage prospects
		Given I am a user
		And I am a player on a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		When I am logged in
		Then I do not see "Prospects"
		And I visit the prospects page	
		Then I see "You do not have access to that page"
