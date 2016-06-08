Feature: User requests invitation

	Scenario: User requests invitation
		Given I am not logged in
		And I visit the new invitation page
		And I fill in "First Name" with "Jeffrey"
		And I fill in "Last Name" with "Lebowski"
		And I fill in "Email" with "dude@gmail.com"
		When I press "Request Invitation"
		Then I am on the home page
		Then I see "Thank you, Jeffrey"
		And I see "Your request has been submitted"

	Scenario: User submits invalid invitation request
		Given I am not logged in
		And I visit the new invitation page
		When I press "Request Invitation"
		Then I see "First name can't be blank"
		And I see "Last name can't be blank"
		And I see "Email can't be blank"

	Scenario: User requests invitation with previously used email
		Given I am not logged in
		And the following invitation request has been submitted:
			| first_name | last_name      | email          |
			| Jeffrey    | Lebowski       | dude@gmail.com |
		And I visit the new invitation page
		And I fill in "First Name" with "Jeffrey"
		And I fill in "Last Name" with "Lebowski"
		And I fill in "Email" with "dude@gmail.com"
		When I press "Request Invitation"
		Then I see "Email has already been taken"
