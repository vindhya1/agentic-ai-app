Feature: Lucky Number API

  Scenario: User submits the correct lucky number
    Given the system has a prefixed lucky number configured
    When the user sends a GET request to "/lucky/{number}" with the matching number
    Then the response status code should be 200
    And the response message should be "Lucky"
    And is_lucky should be true

  Scenario: User submits a wrong number
    Given the system has a prefixed lucky number configured
    When the user sends a GET request to "/lucky/{number}" with a non-matching number
    Then the response status code should be 200
    And the response message should be "Better luck next time"
    And is_lucky should be false

  Scenario: User submits a non-numeric value
    Given the lucky number API is running
    When the user sends a GET request to "/lucky/abc"
    Then the response status code should be 422
    And the response should contain a validation error

  Scenario: User submits zero as the number
    Given the lucky number API is running
    When the user sends a GET request to "/lucky/0"
    Then the response status code should be 422
    And the response should contain a validation error
