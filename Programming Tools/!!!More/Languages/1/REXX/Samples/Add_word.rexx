add_word: procedure expose dictionary.
parse arg w
n = dictionary.0 + 1
dictionary.n = w
dictionary.0 = n
return
