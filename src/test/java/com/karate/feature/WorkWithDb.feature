Feature: Work with DB

  Background:  connect to Db
    * def dbHandler = Java.type('com.karate.helpers.DbHandler')

  Scenario: Insert row with First Name
    * eval dbHandler.insertRow("Qa2")

  Scenario: Give the total price by First Name
    * def name = dbHandler.readTotalPrice("Qa2")
    * print name.totalprice