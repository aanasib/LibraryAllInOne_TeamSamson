Feature: As a librarian, I want to create a new book



  Scenario: Create a new book API
    Given I logged Library api as a "librarian". JES
    And Accept header is "application/json". JES
    And Request Content Type header is "application/x-www-form-urlencoded". JES
    And I create a random "book" as request body. JES
    When I send POST request to "/add_book" endpoint. JES
    Then status code should be 200. JES
    And Response Content type is "application/json; charset=utf-8". JES
    And the field value for "message" path should be equal to "The book has been created.". JES
    And "book_id" field should not be null. JES



  Scenario: Create a new book all layers
    Given I logged Library api as a "librarian". JES
    And Accept header is "application/json". JES
    And Request Content Type header is "application/x-www-form-urlencoded". JES
    And I create a random "book" as request body. JES
    And I logged in Library UI as "librarian". JES
    And I navigate to "Books" page. JES
    When I send POST request to "/add_book" endpoint. JES
    Then status code should be 200. JES
    And Response Content type is "application/json; charset=utf-8". JES
    And the field value for "message" path should be equal to "The book has been created.". JES
    And "book_id" field should not be null. JES
    And UI, Database and API created book information must match. JES