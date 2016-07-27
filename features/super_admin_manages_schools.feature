Feature: Super Admin manages Schools

	Scenario: Super Admin views a list of all Schools
		Given I am logged in as a SuperAdmin
		And the following school:
			| name              | initials | mascot         |
			| Abide High School | AHS      | White Russians |
		When I visit the admin schools page
		Then I see "Abide High School" 

	Scenario: Super Admin views a School
		Given I am logged in as a SuperAdmin
		And the following school:
			| name              | initials | mascot         |
			| Abide High School | AHS      | White Russians |
		And I visit the admin schools page
		When I click "forward" inside the "Abide High School" list item
		Then I see "Edit Abide High School"

	Scenario: Super Admin edits a School
		Given I am logged in as a SuperAdmin
		And the following school:
			| name              | initials | mascot         |
			| Abide High School | AHS      | White Russians |
		And I visit the school show page for "Abide High School"
		And I click "Edit Abide High School"
		And I fill in "Name" with "Abideth High"
		When I press "Save"
		Then I am on the school show page for "Abideth High"
		And I see "Abideth High"
	
