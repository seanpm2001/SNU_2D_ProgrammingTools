MODULE Rectangles;

IMPORT Figures;

TYPE
   Rectangle* = POINTER TO RectangleDesc;

   RectangleDesc* = RECORD
      (Figures.FigureDesc)
      x, y, w, h : INTEGER;
   END;

VAR
   if : Figures.Interface;

PROCEDURE New* (VAR r : Rectangle);
BEGIN
   NEW(r);
   Figures.Init(r, if);
END New;

PROCEDURE Draw* (f : Figure);
   VAR
      r : Rectangle;
BEGIN
   r := f(Rectangle); (* f AS Rectangle *)
   (* ... *)
END Draw;

(* Other procedures here *)

BEGIN (* Module initialisation *)
   NEW(if);
   if.draw  := Draw;
   if.clear := Clear;
   if.mark  := Mark;
   if.move  := Move;
END Rectangles.
