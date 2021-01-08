 GENERIC INTERFACE GenericStack(Element);
 (* Here Element.T is the type to be stored in the generic stack. *)
 TYPE
    T = Public OBJECT;
    Public = OBJECT
    METHODS
        init(): TStack;
        format(): TEXT;
        isEmpty(): BOOLEAN;
        count(): INTEGER;
        push(elm: Element.T);
        pop(VAR elem: Element.T): BOOLEAN;
    END;
 END GenericStack.
