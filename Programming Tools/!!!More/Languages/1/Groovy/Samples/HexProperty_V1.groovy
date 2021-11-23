enum Color {
  BLACK('#000000'), WHITE('#FFFFFF'), RED('#FF0000'), BLUE('#0000FF')
  String hex
  Color(String hex) { 
    this.hex = hex 
  }
}

String.metaClass.getProperty = { String property ->
  def stringColor = delegate
  if (property == 'hex') {
    Color.values().find { it.name().equalsIgnoreCase stringColor }?.hex
  }
}

assert "WHITE".hex == "#FFFFFF"
assert "BLUE".hex == "#0000FF"
assert "BLACK".hex == "#000000"
assert "GREEN".hex == null
