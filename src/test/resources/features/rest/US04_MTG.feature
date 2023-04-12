Feature: As a librarian, I want to create a new user

  Scenario: Create a new user API
    Given I logged Library api as a "librarian". MTG
    And Accept header is "application/json". MTG
    And Request Content Type header is "application/x-www-form-urlencoded". MTG
    And I create a random "user" as request body. MTG
    When I send POST request to "/add_user" endpoint. MTG
    Then status code should be 200. MTG
    And Response Content type is "application/json; charset=utf-8". MTG
    And the field value for "message" path should be equal to "The user has been created.". MTG
    And "user_id" field should not be null. MTG



  Scenario: Create a new user all layers
    Given I logged Library api as a "librarian". MTG
    And Accept header is "application/json". MTG
    And Request Content Type header is "application/x-www-form-urlencoded". MTG
    And I create a random "user" as request body. MTG
    When I send POST request to "/add_user" endpoint. MTG
    Then status code should be 200. MTG
    And Response Content type is "application/json; charset=utf-8". MTG
    And the field value for "message" path should be equal to "The user has been created.". MTG
    And "user_id" field should not be null. MTG
    And created user information should match with Database. MTG
    And created user should be able to login Library UI. MTG
    And created user name should appear in Dashboard Page. MTG
