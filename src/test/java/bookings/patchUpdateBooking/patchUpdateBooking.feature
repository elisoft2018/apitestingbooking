Feature: Test parcial update information booking

  Background:
    * url baseUrl
    * headers headers
    * def userToken = call read('classpath:bookings/authentication/generateUserToken.feature')
    * def createBooking = call read('classpath:bookings/createbooking/createBooking.feature@CreateBookingSucessful')

  @PartialUpdateBooking
  Scenario: Update parcial information booking by id successful
    Given def bookingId = createBooking.response.bookingid
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    And def partialRequestUpdateBooking = read('classpath:bookings/helpers/PartialRequestBodyUpdateBooking.json')
    And request partialRequestUpdateBooking
    When method PATCH
    Then status 200
    And match response != read('classpath:bookings/helpers/ResponseBodyCreateBooking.json')
    And print response

  @PartialUpdateBookingWithoutToken
  Scenario: Update partial booking without toke authentication
    Given def bookingId = createBooking.response.bookingid
    And path 'booking/' + bookingId
    And def badPartialUpdateBooking = read('classpath:bookings/helpers/BadRequestPartialUpdateBooking.json')
    And request badPartialUpdateBooking
    When method PATCH
    Then status 403
    And match response == 'Forbidden'
    And print response

  @PartialUpdateBookingNotFound
  Scenario: Update partial booking with bookingid not found
    Given def bookingId = Math.random()
    And path 'booking/' + bookingId
    And header Cookie = 'token=' + userToken.response.token
    And def partialRequestUpdateBooking = read('classpath:bookings/helpers/PartialRequestBodyUpdateBooking.json')
    And request partialRequestUpdateBooking
    When method PATCH
    Then status 405
    And print response
    And print "La respuesta de la API es 405, pero debería ser 404"






