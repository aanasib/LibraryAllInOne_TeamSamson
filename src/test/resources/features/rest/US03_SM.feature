Feature: As a librarian, I want to create a new book



  Scenario: Create a new book API
    Given I logged Library api as a "librarian". SM
    And Accept header is "application/json". SM
    And Request Content Type header is "application/x-www-form-urlencoded". SM
    And I create a random "book" as request body. SM
    When I send POST request to "/add_book" endpoint. SM
    Then status code should be 200. SM
    And Response Content type is "application/json; charset=utf-8". SM
    And the field value for "message" path should be equal to "The book has been created.". SM
    And "book_id" field should not be null. SM



  Scenario: Create a new book all layers
    Given I logged Library api as a "librarian". SM
    And Accept header is "application/json". SM
    And Request Content Type header is "application/x-www-form-urlencoded". SM
    And I create a random "book" as request body. SM
    And I logged in Library UI as "librarian". SM
    And I navigate to "Books" page. SM
    When I send POST request to "/add_book" endpoint. SM
    Then status code should be 200. SM
    And Response Content type is "application/json; charset=utf-8". SM
    And the field value for "message" path should be equal to "The book has been created.". SM
    And "book_id" field should not be null. SM
    And UI, Database and API created book information must match. SM