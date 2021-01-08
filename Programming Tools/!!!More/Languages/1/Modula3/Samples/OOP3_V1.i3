MODULE Person;

REVEAL T = Public BRANDED 
OBJECT 
  name: TEXT;   (* These two variables *)
  age: INTEGER; (* are private. *)
OVERRIDES
  getAge := Age;
  init := Init;
END;

PROCEDURE Age(self: T): INTEGER =
  BEGIN
    RETURN self.age;
  END Age;

PROCEDURE Init(self: T; name: TEXT; age: INTEGER): T =
  BEGIN
    self.name := name;
    self.age := age;
  RETURN self;
  END Init;

BEGIN
END Person.

