Feature: EPP Plan using cardId

Background:
	* call read('classpath:reusable.feature')

@EasyPaymentPlan1
Scenario: check customer loan eligibility using access token
	#* call read('classpath:Citibank/EPP/CardAuthorization.feature')
	#* call read('classpath:Citibank/EPP/CardAuthorizationAccessToken.feature')
	#* call read('classpath:Citibank/EPP/RefreshAccessToken.feature')
	#* call read('classpath:Citibank/EPP/RevokeToken.feature')
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/creditCards/'+cardid+'/transactions/eligibility/easyPaymentPlan?eligbleLoanAmount=100000' 
	And header Authorization = access_token
	And header client_id = 'f2f08c14-8e53-4b13-862c-bdf182d46df9'
	And header uuid = randomString(20)
	 And header Accept = 'application/json'
	When method get 
	Then status 200
	* print response
	* match response.easyPaymentPlan[0].tenor == '3'
	* match response.easyPaymentPlan[1].tenor == '6'
	* match response.easyPaymentPlan[2].tenor == '12'
	* match response.easyPaymentPlan[3].tenor == '24'
	* print '*********Checked Easy payment plan using AccountId*********'
	
	