Feature: User manages account

	Scenario: User views account
		Given I am logged in as a user
		When I view my account
		Then I see "My Account"
		And I see "Jeffrey Lebowski"
		And I see "dude@gmail.com"
		And I see "Edit Profile"

	Scenario: User edits account
		Given I am logged in as a user
		And I am viewing my account
		And I click "Edit Profile"
		And I fill in "First Name" with "The Dude"
		And I fill in "Last Name" with "Abides"
		When I press "Save"
		Then I see "The Dude Abides"

	Scenario: User changes password
		Given I am logged in as a user
		And I am viewing my account
		And I click "Edit Profile"
		And I fill in "Current Password" with "password"
		And I fill in "New Password" with "rollin"
		And I fill in "New Password Confirmation" with "rollin"
		When I press "Save"
		Then I see "My Account"

	Scenario: User uses wrong current password to reset password
		Given I am logged in as a user
		And I view my account
		And I click "Edit Profile"
		And I fill in "Current Password" with "wrongpassword"
		And I fill in "New Password" with "newpassword"
		And I fill in "New Password Confirmation" with "newpassword"
		When I press "Save"
		Then I see "Current password was incorrect"
