Feature: Delete user on page

  Scenario: Delete a user
    Given url "https://reqres.in/" + "/api/users/" + "2"
    When method delete
    Then status 204



