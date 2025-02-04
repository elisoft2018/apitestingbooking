Feature: Delete bookings of the system

  Background:
    * url baseUrl
    * headers headers
    * def userToken = call read('classpath:bookings/authentication/generateUserToken.feature')
    * def createBooking = call read('classpath:bookings/createbooking/createBooking.feature@CreateBookingSucessful')

  @DeleteBookingSuccessfull
  Scenario: Delete booking existing  by id
    Given def bookingId = createBooking.response.bookingid
    And print "Se eliminara la información asociada al ID: " + bookingId
    And path 'booking/' + bookingId
    And header Content-Type = 'application/json'
    And header accept = 'application/json'
    And header Cookie = 'token=' + userToken.response.token
    When method DELETE
    Then status 201
    And print response

  @DeleteBookingNotFound
  Scenario: Delete booking not existing in the system
    Given def bookingId = Math.random()
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    When method DELETE
    Then status 405
    And match response =='Method Not Allowed'
    And print response
    And print 'El codigo de respuesta que genera es 405, pero debería ser 404'



