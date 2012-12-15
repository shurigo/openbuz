Feature: Create a new task
	If firm or individual user what to find a person or group of people to do a job he/she creates a task in the system.
 
Background:
    Given User authorized

Scenario: View "New Task" button on personal page
    Given User on the personal page
	Then User should see "New Task" button

Scenario: Open "New Task" page
    Given User click "New Task" button
	Then User should see "New Task" page
