Feature: User signup
	Each user has to be registred to be able to post/get a job or do other activities (e.g. post comments/feeback)

Scenario: Invitation code is Valid
	When User populated "Invitation Code" field manualy or form email link
	And Specified Code exists in database
	And Specified code has a status "AVALAIBLE"
	Then Sing-up VK button become avalible
	And Sing-up FB button become avalible

Scenario: Invitation code doesn't exists in database
	When User populated "Invitation Code" field manualy or form email link
	And Specified Code doesn't exist in database
	Then Sing-up VK button become unavalible
	And Sing-up FB button become unavalible	
	And User should see an message "Provided code doesn't exists"

Scenario: Invitation code is not available
	When User populated "Invitation Code" field manualy or form email link
	And Specified Code exists in database
	And Specified code has a status different from "AVALAIBLE" (CONFIRMED or PENDING)
	Then Sing-up VK button become unavalible
	And Sing-up FB button become unavalible	
	And User should see an message "Provided code is not available"
	