def movieList = ['Dersu Uzala', 'Ran', 'Seven Samurai']  // Looks like an array, but is a list
assert movieList[2] == 'Seven Samurai'
movieList[3] = 'Casablanca'  // Adds an element to the list
assert movieList.size() == 4

def monthMap = [ 'January' : 31, 'February' : 28, 'March' : 31 ]  // Declares a map
assert monthMap['March'] == 31  // Accesses an entry
monthMap['April'] = 30  // Adds an entry to the map
assert monthMap.size() == 4

