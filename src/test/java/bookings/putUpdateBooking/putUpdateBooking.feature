Feature: Update the booking information

  Background:
    * url baseUrl
    * headers headers
    * def userToken = call read('classpath:bookings/authentication/generateUserToken.feature')
    * def createBooking = call read('classpath:bookings/createbooking/createBooking.feature@CreateBookingSucessful')

  @UpdateBookingSuccessful
  Scenario: Update total information booking existing by id
    Given def bookingId = createBooking.response.bookingid
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    And def requestBodyUpdateBooking = read('classpath:bookings/helpers/RequestBodyUpdateBooking.json')
    And request requestBodyUpdateBooking
    When method PUT
    Then status 200
    And match response == read('classpath:bookings/helpers/RequestBodyUpdateBooking.json')
    And print response

  @UpdateBookingFailed
  Scenario: Update booking whithout any fields
    Given def bookingId = createBooking.response.bookingid
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    And def badRequestBodyUpdateBooking = read('classpath:bookings/helpers/BadRequestBodyUpdateBooking.json')
    And request badRequestBodyUpdateBooking
    When method PUT
    Then status 400
    And match response == 'Bad Request'

  @UpdateBookingWithoutToken
  Scenario: Update  booking without token authentication
    Given def bookingId = createBooking.response.bookingid
    And path 'booking/' + bookingId
    And def badPartialUpdateBooking = read('classpath:bookings/helpers/RequestBodyUpdateBooking.json')
    And request badPartialUpdateBooking
    When method PUT
    Then status 403
    And match response == 'Forbidden'
    And print response
  @UpdateBookingNotFound
  Scenario: Update booking that not found in the system
    Given def bookingId = Math.random()
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    And def requestBodyUpdateBooking = read('classpath:bookings/helpers/RequestBodyUpdateBooking.json')
    And request requestBodyUpdateBooking
    When method PUT
    Then status 405
    And print response
    And print "El codigo de respuesta es 405, pero debería ser 404 "











