INTERFACE Person;

TYPE T <: Public;
  Public = OBJECT 
  METHODS
    getAge(): INTEGER;
    init(name: TEXT; age: INTEGER): T;
  END;

END Person.
