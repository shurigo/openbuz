Feature: User signup
	Each user has to be registred to be able to post/get a job or do other activities (e.g. post comments/feeback)

Background:
    Given User just open "Singup" page
	And "Sign up with VK" button disabled
	And "Sign up with FB" disabled
	
Scenario: Invitation code is Valid
	When User fill "Invitation Code" field manualy or form email link
	And Specified Code exists in database
	And Specified code has a status "AVALAIBLE"
	Then Sing-up VK button become enabled
	And Sing-up FB button become enabled

Scenario: Invitation code doesn't exists in database
	When User fill "Invitation Code" field manualy or form email link
	And Specified Code doesn't exist in database
	Then Sing-up VK button stay disabled
	And Sing-up FB button stay disabled	
	And User should see an message "Provided code doesn't exists."

Scenario: Invitation code is not available
	When User fill "Invitation Code" field manualy or form email link
	And Specified Code exists in database
	And Specified code has a status different from "AVALAIBLE" (CONFIRMED or PENDING)
	Then Sing-up VK button stay disabled
	And Sing-up FB button stay disubled	
	And User should see a message "Provided code is not available."
	
Scenario: User successfully authorized via his social id
	When User click "Sign up with VK" or "Sign up with FB" button
	And Accept the message saying some the upplication will use his social account data
	Then New user account created
	And User redirected to "Main user page"	
	And User linked to his a user who invited him
    And Invitation code market to "CONFIRMED"

Scenario: User refuze the application to use his social data
	When User click "Sign up with VK" or "Sign up with FB" button
	And User refuze the application to use his social data
	Then User should see a message "You refuce authorized via social network. Account has not been created."	
	And User redirected to "Index page"	
	
	