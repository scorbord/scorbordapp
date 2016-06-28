Feature: Super Admin manages invitation requests

	Scenario: Super Admin views invitation requests
		Given I am logged in as a SuperAdmin
		And the following invitation request has been submitted:
			| first_name | last_name | email          | token  |
			| Jeffrey    | Lebowski  | dude@gmail.com | abc123 |
		When I go to the admin invitations page
		Then I see "Jeffrey Lebowski dude@gmail.com"

	Scenario: Super Admin approves an invitation request
		Given I am logged in as a SuperAdmin
		And the following invitation request has been submitted:
			| first_name | last_name | email          | token  |
			| Jeffrey    | Lebowski  | dude@gmail.com | abc123 |
		And I visit the admin invitations page
		When I click "Approve" in the "Lebowski" row
		Then I see "Approved" in the "Lebowski" row
		And "dude@gmail.com" receives an email with the subject: "Invitation to join Scorbord.com"

	Scenario: Super Admin rejects an invitation request
		Given I am logged in as a SuperAdmin
		And the following invitation request has been submitted:
			| first_name | last_name | email          | token  |
			| Jeffrey    | Lebowski  | dude@gmail.com | abc123 |
		And I visit the admin invitations page
		When I click "Delete" in the "Lebowski" row
		Then I see "Invitation successfully deleted"
		And I do not see "Jeffrey Lebowski dude@gmail.com Accept Reject"
