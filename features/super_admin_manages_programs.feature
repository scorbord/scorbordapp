Feature: SuperAdmin manages Sports Programs for a School

	Scenario: SuperAdmin creates a Program for a School
		Given I am logged in as a SuperAdmin
		And there is a school
		And I visit the school show page for "Abide High School" 
		And I click "Add a Program"
		And I select the "Football" radio button
		When I press "Save"
		Then I am taken to the school show page for "Abide High School"
		And I see "Abide High School"
		And I see "Football"
		And I see "Edit Abide High School"

	Scenario: SuperAdmin removes a Program from a School
		Given I am logged in as a SuperAdmin
		And there is a school
		And there is a Football program for "Abide High School"
		And I visit the school show page for "Abide High School"
		When I click "delete" inside the "Football" list item
		Then I am on the school show page for "Abide High School"
		And I do not see "Football"
		And I see "Edit Abide High School"
