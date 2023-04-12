Feature: : As a user, I want to view my own user information using the API
  so that I can see what information is stored about me


  Scenario Outline: Decode User
    Given I logged Library api with credentials "<email>" and "<password>". RC
    And Accept header is "application/json". RC
    And Request Content Type header is "application/x-www-form-urlencoded". RC
    And I send token information as request body. RC
    When I send POST request to "/decode" endpoint. RC
    Then status code should be 200. RC
    And Response Content type is "application/json; charset=utf-8". RC
    And the field value for "user_group_id" path should be equal to "<user_group_id>". RC
    And the field value for "email" path should be equal to "<email>". RC
    And "full_name" field should not be null. RC
    And "id" field should not be null. RC


    Examples:
      | email                | password    | user_group_id |
      | student5@library     | libraryUser | 3             |
      | librarian10@library  | libraryUser | 2             |
      | student10@library    | libraryUser | 3             |
      | librarian13@library | libraryUser | 2             |
