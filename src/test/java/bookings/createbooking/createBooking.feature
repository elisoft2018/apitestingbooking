Feature: Test for Create booking

  Background:
    * url baseUrl
    * headers headers

  @CreateBookingSucessful
  Scenario: Create booking sucessful
    Given path 'booking'
    And def bodyRequest = read('classpath:bookings/helpers/RequestBodyCreateBooking.json')
    And request bodyRequest
    When method POST
    Then status 200
    And print response
    And match response == read('classpath:bookings/helpers/ResponseSchemaCreateBooking.json')
    And match response == read('classpath:bookings/helpers/ResponseBodyCreateBooking.json')

  @CreateBookingFailed
  Scenario: Create booking without send any fields
    Given path 'booking'
    And def serverErrorBodyRequest = read('classpath:bookings/helpers/ServerErrorRequestBodyCreateBooking.json')
    And request serverErrorBodyRequest
    When method POST
    Then status 500
    And match response == 'Internal Server Error'
    And print response









