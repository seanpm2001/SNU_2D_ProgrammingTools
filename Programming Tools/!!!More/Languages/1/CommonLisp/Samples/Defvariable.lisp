 (defvar *x*)      ; Ensures that a variable *x* exists,
                   ; without giving it a value. The asterisks are part of
                   ; the name, by convention denoting a special (global) variable. 
                   ; The symbol *x* is also hereby endowed with the property that
                   ; subsequent bindings of it are dynamic, rather than lexical.
 (setf *x* 42.1)   ; Sets the variable *x* to the floating-point value 42.1
