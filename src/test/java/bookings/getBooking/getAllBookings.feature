Feature: Test for get all bookings and get bookings by id

  Background:
    * url baseUrl
    * headers headers

  @AllBookings
  Scenario: Get all bookings succesful
    Given path 'booking'
    When method GET
    Then status 200

  @BookingById
  Scenario: Get booking by ID
    Given def createBooking = call read('classpath:bookings/createbooking/createBooking.feature@CreateBookingSucessful')
    And def bookingId = createBooking.response.bookingid
    Given path 'booking/' + bookingId
    When method GET
    Then status 200
    And match response == read('classpath:bookings/helpers/ResponseGetBookingInfo.json')
    And print response

  @BookingNotFound
  Scenario: get booking no exist
    Given def bookingId = Math.random()
    And path 'booking/' + bookingId
    When method GET
    Then status 404
    And match response == 'Not Found'
    And print response







