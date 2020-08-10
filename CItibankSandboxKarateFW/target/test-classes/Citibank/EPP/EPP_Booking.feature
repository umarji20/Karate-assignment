Feature: EPP Booking

Background:
	* call read('classpath:reusable.feature')
* def eppBookingPayload = read('classpath:Citibank/EPP/EPP_BookingPayload.json')
@EPPBooking
Scenario: check monthly payment plan schedule
	* call read('classpath:Citibank/EPP/CardAuthorization.feature')
	* call read('classpath:Citibank/EPP/CardAuthorizationAccessToken.feature')
	* call read('classpath:Citibank/EPP/RefreshAccessToken.feature')
	* call read('classpath:Citibank/EPP/RevokeToken.feature')
	* call read('classpath:Citibank/EPP/EPP_Plan.feature')
	* call read('classpath:Citibank/EPP/EPPMonthlyRepayment.feature')
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/creditCards/'+cardid+'/easyPaymentPlans/bookings' 
	And header Authorization = access_token
	And header client_id = 'f2f08c14-8e53-4b13-862c-bdf182d46df9'
	And header uuid = randomString(20)
	 And header Accept = 'application/json'
	 And header Content-Type = 'application/json'
	 And request eppBookingPayload
	When method post
	Then status 200
	* print response
	* print '********* EPP Booked *********'