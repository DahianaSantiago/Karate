Feature: Get user on page

  Background:
    * url "https://reqres.in/"

  Scenario: Get a user
    Given path "/api/users/" + "2"
    When method get
    Then status 200

    Scenario: Get a list of user
      * def jsonResponse = read('../json/userList.json')
      Given url "https://reqres.in/api/users?page=1"
      When method get
      Then status 200
      And match $ == jsonResponse

  Scenario: get the list and validate the format of the list
    Given path "api/users?page=2"
    When method get
    Then status 200
    And match response.data == "#array"

  Scenario: get the color from the list and validate the format of color
    Given path "api/users?page=1"
    When method get
    Then status 200
    And match response.data[0].color == "#string"

  Scenario: get a list of users and validate the name of the first name in the array
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data[0].pantone_value == "15-4020"