Feature: Articles

  Background:
    * def dataGenerator = Java.type('com.karate.helpers.DataGenerator')
    * def randomName = dataGenerator.getRandomUsername()
    * url apiUrlLocalhost


  Scenario: Sign in with user and create random article name
    * path 'users/login'
    * request {"user": {"email": "test12user@test.com", "password": "test12user"}}
    * method Post
    * status 200
    * def token = response.user.token


    Given header Authorization = 'Token ' + token
    And path 'articles'
    When   request
    """
      {
          "article": {
              "tagList": [],
              "title": #(randomName),
              "description": "for testing",
              "body": "test123"
          }
      }
    """
    And  method Post
    Then  status 200
    And   match response.article.title == randomName