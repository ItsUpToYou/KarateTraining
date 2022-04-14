
Feature: Test for home page
  Background:
    * url apiUrlLocalhost

  Scenario: Get tags and validate with different way
    Given path 'tags'
    When method get
    Then status 200
    And match response.tags contains ['implementations', 'codebaseShow']
    And match response.tags !contains 'test'
    And match response.tags contains any ['welcome', 'introduction']
    And match response.tags == '#array'
    And match each response.tags == "##string"


    Scenario: Get  articles from the page
      Given params {limit: 10, offset: 0}
      Given path 'articles'
      When method Get
      Then status 200
      And match response.articles == '#[3]'
      And match response.articlesCount == 3
      And match response == {"articles" : '#array', "articlesCount" : 3}
      And match response.articles[0].createdAt contains '2021'
      And match response.articles[*].favoritesCount !contains [0]
      And match response..bio contains null
      And match each response..following == false