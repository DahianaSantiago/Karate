Feature: Post user on page

  Background:
    * url "https://reqres.in/"
    * path "/api/users/"
    * request { "name": "#(name)", "job": "#(job)" }
    ##* def var = { "name": "Dahia", "job": "leader" }

  Scenario Outline: Post a user
    When method post
    Then status 201

    Examples:
      | name     | job    |
      | Dahiana  | Leader |
      | Santiago | QA     |
      | Stanley  | Leader |

  Scenario: Post a user without job
    Given request { "name": "Dahia" }
    When method post
    Then status 201

    Scenario: Post a user with invalid name
      Given request { "name": "@/&/Q(q" }
      When method post
      Then status 201

  Scenario: post a user with id
    Given request { "name": "Dahia", "id": "1234" }
    When method post
    Then status 201


