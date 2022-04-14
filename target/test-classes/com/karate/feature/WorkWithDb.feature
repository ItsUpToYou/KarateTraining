
  Feature: Work with DB

    Background:  connect to Db
      * def dbHandler = Java.type('com.karate.helpers.DbHandler')

      Scenario: Insert new row
        * eval dbHandler.insertRow("Qa2")
    @test
      Scenario: Give the total price by name
        * def name = dbHandler.readTotalPrice("Qa2")
        * print name.totalprice