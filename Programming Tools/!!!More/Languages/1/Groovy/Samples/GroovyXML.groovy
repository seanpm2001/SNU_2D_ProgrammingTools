def writer = new StringWriter()
def builder = new groovy.xml.MarkupBuilder(writer)
builder.languages {
  language(year: 1995) {
    name "Java"
    paradigm "object oriented"
    typing "static"
  }
  language (year: 1995) {
    name "Ruby"
    paradigm "functional, object oriented"
    typing "duck typing, dynamic"
  }
  language (year: 2003) {
    name "Groovy"
    paradigm "functional, object oriented"
    typing "duck typing, dynamic, static"
  }
}

