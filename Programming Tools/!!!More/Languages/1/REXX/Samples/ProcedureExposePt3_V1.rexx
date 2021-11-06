add_word: procedure expose dictionary.
parse arg w .
dictionary.w = dictionary.w + 1
if dictionary.w = 1 /* assume dictionary. = 0 */
then do
n = dictionary.0+1
dictionary.n = w
dictionary.0 = n
end
return
