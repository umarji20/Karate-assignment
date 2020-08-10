Feature: EPP Revoke Access Token

Background: 
	* call read('classpath:reusable.feature')
      
@RevokeToken
Scenario: Refresh the access token
	#* call read('classpath:Citibank/EPP/CardAuthorization.feature')
	#* call read('classpath:Citibank/EPP/CardAuthorizationAccessToken.feature')
	#* call read('classpath:Citibank/EPP/RefreshAccessToken.feature')
	Given url 'https://sandbox.apihub.citi.com/gcb/api/cardAuth/oauth2/revoke' 
	And header Authorization = 'Basic ZjJmMDhjMTQtOGU1My00YjEzLTg2MmMtYmRmMTgyZDQ2ZGY5Olk4eVAzYk43Z1MzbFEwYUMzd0UwcVkzb0M0Z1Uwa0swc0kxdUk1aEY2d0Y2cUw0a0Ez'
	 And header client_id = 'f2f08c14-8e53-4b13-862c-bdf182d46df9'
	And header uuid = randomString(20)
	 And header Accept = 'application/json'
	 And header Content-Type = 'application/x-www-form-urlencoded'
	 And form field token = refreshAccessToken
	And form field token_type_hint = 'access_token'
	When method post 
	Then status 200 
	* print response
	* print '*********Revoked Token *********'