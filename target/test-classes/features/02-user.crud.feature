Feature: CRUD de usuarios

Background:
  * url baseUrl
  * header Authorization = 'Bearer ' + token
  * header Accept = 'application/json'
  * header Content-Type = 'application/json'

Scenario: Create user -> Update user -> Delete user

  # Generar email único usando timestamp
  * def ts = new Date().getTime()
  * def email = 'angie.' + ts + '@15ce.com'
  * def payload = 
  """
  {
    "name": "Tenali Ramakrishna",
    "gender": "male",
    "email": "#(email)",
    "status": "active"
  }
  """

  # Crear usuario
  Given path 'users'
  And request payload
  When method post
  Then status 201
  And match response.name == payload.name
  #* def userId = response.id
  * def userId = response.id

  * eval Java.type('java.lang.Thread').sleep(10000)
  # Update usuario
  * def updateEmail = 'angie.' + ts + '@15ce.com'
  * def update = 
  """
  {
    "name": "Angelica Rodriguez",
    "email": "#(updateEmail)",
    "status": "active"
  }
  """

  Given path 'users', userId
  And request update
  When method patch
  Then status 200
  And match response.name == update.name

  # Delete usuario
  Given path 'users', userId
  When method delete
  Then status 204
