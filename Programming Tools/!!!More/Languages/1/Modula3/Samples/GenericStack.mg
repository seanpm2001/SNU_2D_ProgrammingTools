 GENERIC MODULE GenericStack(Element);
 < ... generic implementation details... >
 PROCEDURE Format(self: T): TEXT =
 VAR
    str: TEXT;
 BEGIN
    str := Element.Name & "Stack{";
    FOR k := 0 TO self.n -1 DO
        IF k > 0 THEN str := str & ", "; END;
            str := str & Element.Format(self.arr[k]);
    END;
    str := str & "};";
    RETURN str;
 END Format;
 < ... more generic implementation details... >
 END GenericStack.

