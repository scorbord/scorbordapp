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
		And "steven@scorbord.com" receives an email with the subject: "[SB] New Invitation Request (Jeffrey Lebowski)"

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

	Scenario: User redeems invitation
		Given SuperAdmin approves the following invitation request:
			| first_name | last_name      | email          |
			| Jeffrey    | Lebowski       | dude@gmail.com |
		When I click "Accept Invitation" in the email for 'dude@gmail.com'
		And I fill in "Password" with "password"
		And I fill in "Password Confirm" with "password"
		When I press "Redeem Invitation"
		Then I see "dude@gmail.com" in the sidenav

	Scenario: User submits invalid password and password confirmation at Invitation Redeem
		Given SuperAdmin approves the following invitation request:
			| first_name | last_name      | email          |
			| Jeffrey    | Lebowski       | dude@gmail.com |
		When I click "Accept Invitation" in the email for 'dude@gmail.com'
		And I fill in "Password" with "password"
		And I fill in "Password Confirm" with "wrongpassword"
		When I press "Redeem Invitation"
		Then I am viewing the redeem page for the invitation
		And I see "Password confirmation doesn't match"

	Scenario: User cannot submit nil passwords at Invitation Redeem
		Given SuperAdmin approves the following invitation request:
			| first_name | last_name      | email          |
			| Jeffrey    | Lebowski       | dude@gmail.com |
		And I click "Accept Invitation" in the email for 'dude@gmail.com'
		When I press "Redeem Invitation"
		Then I am viewing the redeem page for the invitation
		And I see "Password can't be blank"

	Scenario: User cannot accept invitation multiple times
		Given SuperAdmin approves the following invitation request:
			| first_name | last_name      | email          |
			| Jeffrey    | Lebowski       | dude@gmail.com |
		When I click "Accept Invitation" in the email for 'dude@gmail.com'
		And I fill in "Password" with "password"
		And I fill in "Password Confirm" with "password"
		And I press "Redeem Invitation"
		Then I see "dude@gmail.com" in the sidenav
		Then I logout
		When I click "Accept Invitation" in the email for 'dude@gmail.com'
		Then I am taken to the login page


