Feature: Practising Karate

  Background: Precondition
    * url apiUrlTypiCodeCom
    * def postRequestBody = read('classpath:com/karate/json/newArticlesRequest.json')


  Scenario: Create New Post by json file
    Given path 'posts'
    And request postRequestBody
    When method Post
    Then status 201

  Scenario: Create data
    Given path 'posts'
    When request {"userId": 123,  "id": 101,  "title": "WillDelete",  "body": "textTest"}
    And method Post
    Then status 201
    And match response.userId == 123

  Scenario: Delete the data
    Given path 'posts',123
    When method Delete
    Then status 200

  Scenario: Check if deleted data exist
    Given path 'posts'
    When method Get
    Then status 200
    And match response[0].userId != 123


  Scenario: Conditional logic
    Given params {limit: 3, offset: 0}
    And path 'users'
    When method Get
    Then status 200
    And match response[0].id == 1
    * def usr = response[0].id
    * def ar = response[0].name
    * if (usr == 1) karate.call('classpath:feature/FakeDataForTesting.feature', ar)


  Scenario: Retry call
    * configure retry = {count: 5, interval:100}
    Given params { limit: 10, offset: 0}
    And path 'users'
    When retry until response[0].name == 'Leanne Graham1'
    Then method Get
    And status 200

  Scenario: Sleep call
    * def sleep = function (pause){java.lang.Thread.sleep(pause)}
    Given params { limit: 10, offset: 0}
    And path 'users'
    When method Get
    * eval sleep (3000)
    Then status 200