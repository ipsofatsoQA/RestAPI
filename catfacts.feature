Feature: Cats Facts end Point Tests

Scenario: Check: response type format, header values in the response, and key value data type.
    Given url 'https://cat-fact.herokuapp.com'
    And path '/facts/random'
    And param animal_type = 'horse'
    When method get
    Then status 200
    Then match responseType == 'json'
    And match header Content-Type == 'application/json; charset=utf-8'
    And match response contains { "type": "#string"}

Scenario: Check number of elements in the response array is True
    Given url 'https://cat-fact.herokuapp.com'
    And path '/facts/random'
    And param animal_type = 'cat'
    And param amount = 2
    When method get
    Then status 200
    And assert response.length == 2