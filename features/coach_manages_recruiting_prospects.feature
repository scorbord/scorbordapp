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

	Scenario: Coach adds a Contact to a Prospect
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a contact"
		And I select "Father" from "Relation"
		And I select "Mr." from "Salutation"
		And I fill in "First Name" with "Landad"
		And I fill in "Last Name" with "Finishovan"
		And I fill in "Primary Phone" with "770-777-8532"
		And I fill in "Email" with "landad@example.com"
		And I press "Save"
		Then I see "Mr. Landad Finishovan Father"

	Scenario: Coach edits a Prospect's Contact
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And the prospect "Landon Donovan" has the following contacts:
			| relation | salutation | first_name | last_name  |
			| Father   | Mr.        | Landad     | Finishovan |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "edit" in the "Mr. Landad Finishovan" card actions
		And I fill in "Last Name" with "Donovan"
		And I press "Save"
		Then I see "Mr. Landad Donovan"

	Scenario: Coach removes a Prospect's Contact
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And the prospect "Landon Donovan" has the following contacts:
			| relation | salutation | first_name | last_name  |
			| Father   | Mr.        | Landad     | Finishovan |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "delete" in the "Landad" card actions
		Then I do not see "Mr. Landad Finishovan"
		And I see "Landad deleted from contacts"

	Scenario: Coach adds a Coach to a Prospect
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a coach"
		And I fill in "First Name" with "Coach"
		And I fill in "Last Name" with "McCoacherson"
		And I select the "High School" radio button
		And I fill in "Team Name" with "Abide High School"
		And I fill in "Primary Phone" with "770-777-8532"
		And I fill in "Email" with "coach@examplehs.edu"
		And I press "Save"
		Then I see "Coach McCoacherson"
		And I see "Abide High School"

	Scenario: Coach edits a Prospect's Contact
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And the prospect "Landon Donovan" has the following coaches:
			| first_name | last_name |
			| Coach      | McCoach   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "edit" in the "Coach McCoach" card actions
		And I fill in "Last Name" with "Donovan"
		And I press "Save"
		Then I see "Coach Donovan"

	Scenario: Coach removes a Prospect's Contact
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And the prospect "Landon Donovan" has the following coaches:
			| first_name | last_name |
			| Coach      | McCoach   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "delete" in the "Coach McCoach" card actions
		Then I do not see "Coach McCoach"

	Scenario: Coach adds a YouTube Highlight to a Prospectwith a long URL
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a highlight"
		And I fill in "Link" with "https://www.youtube.com/watch?v=SHU9pzmZcsQ"
		And I press "Save"
		Then I see the video "https://www.youtube.com/embed/SHU9pzmZcsQ?rel=0" embedded

	Scenario: Coach adds a YouTube Highlight to a Prospect with a short URL
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a highlight"
		And I fill in "Link" with "https://youtu.be/-HXotI1O6Tk"
		And I press "Save"
		Then I see the video "https://www.youtube.com/embed/-HXotI1O6Tk?rel=0" embedded

	Scenario: Coach adds a Vimeo Highlight to a Prospect
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a highlight"
		And I fill in "Link" with "https://vimeo.com/151912128"
		And I press "Save"
		Then I see the video "https://player.vimeo.com/video/151912128" embedded

	Scenario: Coach adds a hudl Highlight to a Prospect with a short URL
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a highlight"
		And I fill in "Link" with "http://www.hudl.com/v/1ksW1K"
		And I press "Save"
		Then I see the video "//www.hudl.com/embed/video/3/382394/5721a9c9c124573b54362fe4" embedded

	Scenario: Coach adds a hudl Highlight to a Prospect with a long URL
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "add a highlight"
		And I fill in "Link" with "http://www.hudl.com/video/3/382394/5721a9c9c124573b54362fe4"
		And I press "Save"
		Then I see the video "//www.hudl.com/embed/video/3/382394/5721a9c9c124573b54362fe4" embedded

	Scenario: Coach deletes a highlight from a Prospect
		Given I am logged in as a user
		And I have a Soccer team named "The Kickers"
		And the "The Kickers" team has the following prospects:
			| first_name | last_name |
			| Freddy     | Adu       |
			| Landon     | Donovan   |
		And the prospect "Donovan" has the highlight "https://www.youtube.com/watch?v=9bZkp7q19f0"
		And I visit the prospects page
		And I click "view" in the "Donovan" row
		When I click "delete"
		Then I do not see the video "https://www.youtube.com/embed/9bZkp7q19f0?rel=0" embedded

