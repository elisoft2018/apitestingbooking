Feature:Generate user token for update and delete operations

  Background:
* url baseUrl

  @GenerateUserToken
  Scenario:
    Given path 'auth'
    And def requestBodyGenerateToken = read('classpath:bookings/helpers/RequestBodyGenerateToken.json')
    And request requestBodyGenerateToken
    When method POST
    Then status 200
    And match response.token != null
    And print response
