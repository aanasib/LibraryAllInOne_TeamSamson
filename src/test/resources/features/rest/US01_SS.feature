Feature: As a librarian, I want to retrieve all users


  Scenario: Retrieve all users from the API endpoint

    Given I logged Library api as a "librarian". SS
    And Accept header is "application/json". SS
    When I send GET request to "/get_all_users" endpoint. SS
    Then status code should be 200. SS
    And Response Content type is "application/json; charset=utf-8". SS
    And "id" field should not be null. SS
    And "name" field should not be null. SS




