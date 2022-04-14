Feature: Create Token

  Scenario: Create Token
    Given url apiUrlLocalhost
    And path 'users/login'
    When request {"user": {"email": "#(userEmail)", "password": "#(userPassword)"}}
    And method Post
    Then status 200