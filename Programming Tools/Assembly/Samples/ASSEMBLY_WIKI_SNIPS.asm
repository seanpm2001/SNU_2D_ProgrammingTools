; Start

; Assembly examples from Wikipedia

; Section 1
MOV AL, 61h       ; Load AL with 97 decimal (61 hex)
; Section 2
MOV AL, 1h        ; Load AL with immediate value 1
MOV CL, 2h        ; Load CL with immediate value 2
MOV DL, 3h        ; Load DL with immediate value 3
; Section 3
MOV EAX, [EBX]	  ; Move the 4 bytes in memory at the address contained in EBX into EAX
MOV [ESI+EAX], CL ; Move the contents of CL into the byte at address ESI+EAX
MOV DS, DX        ; Move the contents of DX into segment register DS

; File version: 1 (Monday, June 8th 2020 at 5:27 pm)

; End
