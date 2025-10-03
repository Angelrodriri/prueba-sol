Feature: List users
    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Accept = 'application/json'
        * header Content-Type = 'application/json'

    Scenario: List users is empty
        Given path 'users'
        When method get
        Then status 200
        And match response == '#[]'
        
    Scenario: List users contains at least one user
        Given path 'users'
        When method get
        Then status 200
        And match response[0].id == '#number'