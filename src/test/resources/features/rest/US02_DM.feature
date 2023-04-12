Feature: As a user, I want to search for a specific user by their id
        so that I can quickly find the information I need.


  Scenario: Retrieve single user
    Given I logged Library api as a "librarian". DM
    And Accept header is "application/json". DM
    And Path param is "1". DM
    When I send GET request to "/get_user_by_id/{id}" endpoint. DM
    Then status code should be 200. DM
    And Response Content type is "application/json; charset=utf-8". DM
    And "id" field should be same with path param. DM
    And following fields should not be null. DM
      | full_name |
      | email     |
      | password  |