structure
   byte:       flag           \ 3bit flags + length of word's name
   char-array: name           \ name's runtime length isn't known at compile time
   address:    previous       \ link field, backward ptr to previous word
   address:    codeword       \ ptr to the code to execute this word
   any-array:  parameterfield \ unknown length of data, words, or opcodes
end-structure forthword
