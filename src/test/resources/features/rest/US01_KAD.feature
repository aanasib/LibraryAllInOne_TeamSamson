Feature: As a librarian, I want to retrieve all users


  Scenario: Retrieve all users from the API endpoint

    Given I logged Library api as a "librarian". KAD
    And Accept header is "application/json". KAD
    When I send GET request to "/get_all_users" endpoint. KAD
    Then status code should be 200. KAD
    And Response Content type is "application/json; charset=utf-8". KAD
    And "id" field should not be null. KAD
    And "name" field should not be null. KAD




