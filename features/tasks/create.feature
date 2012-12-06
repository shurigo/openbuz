Feature: Create new task
	Each firm has to be registred and authorized to be able to post job

Scenario: Firm specified correct e-mail
	When Firm entered an email in "E-mail" field
	And Entered email has "@" sign 
	Then Email valid simbol appeared

Scenario: Firm specified incorrect e-mail
	When Firm entered an email in "E-mail" field
	And Entered email doesn't have "@" sign 
	Then Email invalid simbol appeared

Scenario: Firm specified correct password
	When Firm entered a password in "Password" field
	And Password 8 sign length
	And Password has one capital later
	And Password has one special character 
	Then Password valid simbol appeared	
	
Scenario: Firm successfully registred
	When Firm input valid email
	And Firm input valid password
	And Firm press "Sign up" button
	Then Firm account created in the system
	And Firm redirected to "Main firm page"	
	And Firm should see an message "To be able to create tasks in the system you have to sign agreements. Template can be downloaded form here"	
	And Email notification sent to the Firm specified address
    
Scenario: Firm activation
	When Firm sucessfully registred in the system
	And Required agreements were signed 
	Then System sales activate the firm account
	
	