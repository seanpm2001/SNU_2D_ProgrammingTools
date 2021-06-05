personCheck = ->
  if not person? then alert("No person") else alert("Have person")
person = null
personCheck()
person = "Ivan"
personCheck()
