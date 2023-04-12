Feature: As a user, I want to search for a specific user by their id
        so that I can quickly find the information I need.


  Scenario: Retrieve single user
    Given I logged Library api as a "librarian". MC
    And Accept header is "application/json". MC
    And Path param is "1". MC
    When I send GET request to "/get_user_by_id/{id}" endpoint. MC
    Then status code should be 200. MC
    And Response Content type is "application/json; charset=utf-8". MC
    And "id" field should be same with path param. MC
    And following fields should not be null. MC
      | full_name |
      | email     |
      | password  |