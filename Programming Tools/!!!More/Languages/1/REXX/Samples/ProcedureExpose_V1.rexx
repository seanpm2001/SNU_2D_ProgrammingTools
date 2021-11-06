add_word: procedure expose count. word_list
parse arg w .
count.w = count.w + 1 /* assume count. has been set to 0 */
if count.w = 1 then word_list = word_list w
return
