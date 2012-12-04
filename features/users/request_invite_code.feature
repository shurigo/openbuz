Feature: Request a public invite code
	To be able to register a user has to have an invite code. He/she can requiest it from an already registred user of from the public pool. 
	The number of public invitation codes is limited by 5000.

Scenario: Public invitation codes are avalible	
	When User open "Sign-up Form"
	And There are more tan 0 public invitation codes with "AVAILAIBLE" status
	Then User should see the link "Request an invitation code"
	
Scenario: User sucessfuly recived a public invitation code	
	When User click "Request an invitation code" link
	And User input a valid e-mail address in a pop-up form
	And User submit the form
	Then User should recive an email with a public invitation code
	
Scenario: Specified email already exisit for a registred user	
	When User click "Request an invitation code" link
	And User input a valid e-mail address in a pop-up form
	And The email already exists in the database
	And User submit the form
	Then User should see a message "Specified e-mail already exists for a registred users"
    And  The e-mail field become blank 	
	
Scenario: Populate an invitation code field in "Sign-up Form" from an e-mail link
	When User click at "Activate invitation code" link from recived email
	Then "Invitation Code" field automaticly populated from an e-mail link

    