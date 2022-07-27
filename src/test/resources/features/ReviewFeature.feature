@End2End
Feature: New Account Feature

Background: generate token for all scenarios.
 	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	* def generatedToken = response.token
	And header Authorization = "Bearer " + generatedToken

Scenario: Create new Account, add its address, phone number, car
	* def generator = Java.type('tiger.api.test.fake.data.Datagenerator')	
	* def email = generator.getEmail()
	* def firstName = generator.getFirstName()
	* def lastName = generator.getLastName()
	* def dob = generator.getDob()
	* def street = generator.getAddrStreet()
	* def city = generator.getAddrCity()
	* def state = generator.getAddrState()
	* def zip = generator.getAddrZip()
	* def countryCode = generator.getAddrCountryCode()
	* def phone = generator.getPhoneNumber()
	
	And print email
	And print firstName
	And print lastName
	And print dob
	And print street
	And print city
	And print state
	And print zip
	And print countryCode
	And print phone
	And print generatedToken
	Given path "/api/accounts/add-primary-account"
	And request
	""" 
	{
	"email": "#(email)",
	"title": "Mr.",
	"firstName": "#(firstName)",
	"lastName": "#(lastName)",
	"gender": "MALE",
	"maritalStatus": "MARRIED",
	"employmentStatus": "Software Engineer",
	"dateOfBirth": "#(dob)"
	}
	"""
	When method post
	Then status 201
    * def generatedId = response.id
  And print generatedId
	And print response
# Adding phone number
 	Given path "/api/accounts/add-account-phone"
 	And param primaryPersonId = generatedId
	And header Authorization = "Bearer " + generatedToken
 	And request 
 	"""
 	{
 	"phoneNumber": "#(phone)",
 	"phoneExtension": "123",
 	"phoneTime": "morning",
 	"phoneType": "mobile"
 	}
 	"""
	And print generatedToken
 	When method post
 	Then status 201
 	And print response
#Adding address	
 	Given path "/api/accounts/add-account-address"
 	And param primaryPersonId = generatedId
	And header Authorization = "Bearer " + generatedToken
 	And request 
 	"""
 	{
 	"addressType": "Apartment",
 	"addressLine1": "#(street)",
 	"city": "#(city)",
 	"state": "#(state)",
 	"postalCode": "#(zip)",
 	"countryCode": "#(countryCode)",
 	"current": true
 	}
 	"""
 	When method post
 	Then status 201
 	And print response
#Adding car	
 	Given path "/api/accounts/add-account-car"
 	And param primaryPersonId = generatedId
	And header Authorization = "Bearer " + generatedToken
 	And request 
 	"""
 	{
  "make": "Honda",
  "model": "Civic",
  "year": "2019",
  "licensePlate": "ABC-8080"
 	}
 	"""
 	When method post
 	Then status 201
 	And print response
	
 