 INTERFACE IntegerElem;
 CONST Name = "Integer";
 TYPE T = INTEGER;
 PROCEDURE Format(x: T): TEXT;
 PROCEDURE Scan(txt: TEXT; VAR x: T): BOOLEAN;
 END IntegerElem.
