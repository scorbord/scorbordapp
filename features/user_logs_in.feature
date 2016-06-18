Feature: User logs in

	Scenario: User logs in
		Given the following user:
			| first_name | last_name | email 					|
			| Jeffrey 	 | Lebowski  | dude@gmail.com |
		And I go to the login page
		And I fill in "Email address" with "dude@gmail.com"
		And I fill in "Password" with "password"
		When I press "Login"
		Then I see "Jeffrey"
		And I see "Account"

	Scenario: Invalid login with no credentials
		Given I go to the login page
		And I press "Login"
		Then I am on the login page
		And I see "Invalid email-password combination"

	Scenario: Invalid login with invalid email format
		Given the following user:
			| first_name | last_name | email 					|
			| Jeffrey 	 | Lebowski  | dude@gmail.com |
		And I go to the login page
		And I fill in "Email address" with "dude@"
		And I fill in "Password" with "password"
		When I press "Login"
		Then I am on the login page
		And I see "Invalid email-password combination"

	Scenario: Invalid login with unclaimed email address
		Given I visit the login page
		And I fill in "Email address" with "youwillnevergetthis@gmail.com"
		And I fill in "Password" with "password"
		When I press "Login"
		Then I am on the login page
		And I see "Invalid email-password combination"

	Scenario: Invalid login with incorrect password
		Given the following user:
			| first_name | last_name | email 					|
			| Jeffrey 	 | Lebowski  | dude@gmail.com |
		And I go to the login page
		And I fill in "Email address" with "dude@"
		And I fill in "Password" with "wrongpassword"
		When I press "Login"
		Then I am on the login page
		And I see "Invalid email-password combination"

	Scenario: User logs out
		Given I am logged in as a user
		And I click "Logout"
		Then I am on the home page
		And I see "Login"

