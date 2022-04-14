
Feature: Test for home page
  Scenario: Get all tags
    Given url 'https://conduit.productionready.io/api/tags'
    When method get
    Then status 201

    Scenario: Get 3 articles from the page
      Given params {limit: 10, offset: 0}
      Given url 'https://conduit.productionready.io/api/articles'
      When method Get
      Then status 200