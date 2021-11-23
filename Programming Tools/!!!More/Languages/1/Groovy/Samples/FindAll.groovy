def languages = new XmlSlurper().parseText writer.toString()

// Here is employed Groovy's regex syntax for a matcher (=~) that will be coerced to a 
// boolean value: either true, if the value contains our string, or false otherwise.
def functional = languages.language.findAll { it.paradigm =~ "functional" }
assert functional.collect { it.name } == ["Groovy", "Ruby"]
