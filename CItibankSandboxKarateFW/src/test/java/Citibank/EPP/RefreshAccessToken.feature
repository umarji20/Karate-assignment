Feature: EPP CardAuthorization Refresh Access Tolen

Background: 
	* call read('classpath:reusable.feature')
      
@RefreshToken
Scenario: Refresh the access token
	#* call read('classpath:Citibank/EPP/CardAuthorization.feature')
	#* call read('classpath:Citibank/EPP/CardAuthorizationAccessToken.feature')
	Given url 'https://sandbox.apihub.citi.com/gcb/api/cardAuth/oauth2/refresh' 
	And header Authorization = 'Basic ZjJmMDhjMTQtOGU1My00YjEzLTg2MmMtYmRmMTgyZDQ2ZGY5Olk4eVAzYk43Z1MzbFEwYUMzd0UwcVkzb0M0Z1Uwa0swc0kxdUk1aEY2d0Y2cUw0a0Ez'
	 And header client_id = 'f2f08c14-8e53-4b13-862c-bdf182d46df9'
	And header uuid = randomString(20)
	 And header Accept = 'application/json'
	 And header Content-Type = 'application/x-www-form-urlencoded'
	And form field grant_type = 'refresh_token' 
	And form field refresh_token = refreshToken 
	When method post 
	Then status 200 
	* print response
	* match response.refresh_token == '#string'
	* match response.refresh_token_expires_in == '#number'
	* def refreshAccessToken = response.access_token
	* print 'Refresh Access Token : '+refreshAccessToken
	* def refreshTokenNew = response.refresh_token
	* def resfreshTokenExpireIn = response.refresh_token_expires_in
	* print 'Refresh Access Token : '+refreshTokenNew
	* print 'Expiration Duration : '+resfreshTokenExpireIn
	* print '*********Refresh Token Generated*********'