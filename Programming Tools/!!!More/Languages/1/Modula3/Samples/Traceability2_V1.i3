MODULE B;

IMPORT A;
FROM A IMPORT Color;

VAR
  aColor: A.Color;  (* Uses the module name as a prefix *)
  theColor: Color;  (* Does not have the module name as a prefix *)
  anotherColor: A.Color;

BEGIN
  aColor := A.Color.Brown;
  theColor := Color.Red;
  anotherColor := Color.Orange;  (* Can't simply use Orange *)
END B.

