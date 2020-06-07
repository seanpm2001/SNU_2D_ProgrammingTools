-- Start
-- Compiled from https://en.wikipedia.org/wiki/Ada_(programming_language)
-- File version: 1 (October 12th 2019)
-- Latest version: 1 (October 12th 2019)
-- First version: 1 (October 12th 2019)
-- Size: 007,.915 bytes (007,.915 Kilobytes)
-- Line count: 0,.211
-- Language: ADA 2012
-- Hello world program
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
begin
	Put_Line ("Hello, world!");
end Hello;
-- GNAT equivalent
gnatmake hello.adb
-- Date record
type Day_type   is range    1 ..   31;
type Month_type is range    1 ..   12;
type Year_type  is range 1800 .. 2100;
type Hours is mod 24;
type Weekday is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);

type Date is
   record
     Day   : Day_type;
     Month : Month_type;
     Year  : Year_type;
   end record;
-- Subtypes
subtype Working_Hours is Hours range 0 .. 12;            -- at most 12 Hours to work a day
subtype Working_Day is Weekday range Monday .. Friday;   -- Days to work

Work_Load: constant array(Working_Day) of Working_Hours  -- implicit type declaration
   := (Friday => 6, Monday => 4, others => 10);           -- lookup table for working hours with initialization
-- Control structures
-- while a is not equal to b, loop.
while a /= b loop
  Ada.Text_IO.Put_Line ("Waiting");
end loop;

if a > b then
  Ada.Text_IO.Put_Line ("Condition met");
else
  Ada.Text_IO.Put_Line ("Condition not met");
end if;

for i in 1 .. 10 loop
  Ada.Text_IO.Put ("Iteration: ");
  Ada.Text_IO.Put (i);
  Ada.Text_IO.Put_Line;
end loop;

loop
  a := a + 1;
  exit when a = 10;
end loop;

case i is
  when 0 => Ada.Text_IO.Put ("zero");
  when 1 => Ada.Text_IO.Put ("one");
  when 2 => Ada.Text_IO.Put ("two");
  -- case statements have to cover all possible cases:
  when others => Ada.Text_IO.Put ("none of the above");
end case;

for aWeekday in Weekday'Range loop               -- loop over an enumeration
   Put_Line ( Weekday'Image(aWeekday) );         -- output string representation of an enumeration
   if aWeekday in Working_Day then               -- check of a subtype of an enumeration
      Put_Line ( " to work for " &
               Working_Hours'Image (Work_Load(aWeekday)) ); -- access into a lookup table
   end if;
end loop;
-- Packages
package Example is
     type Number is range 1 .. 11;
     procedure Print_and_Increment (j: in out Number);
end Example;
-- Package body
with Ada.Text_IO;
package body Example is

  i : Number := Number'First;

  procedure Print_and_Increment (j: in out Number) is

    function Next (k: in Number) return Number is
    begin
      return k + 1;
    end Next;

  begin
    Ada.Text_IO.Put_Line ( "The total is: " & Number'Image(j) );
    j := Next (j);
  end Print_and_Increment;

-- package initialization executed when the package is elaborated
begin
  while i < Number'Last loop
    Print_and_Increment (i);
  end loop;
end Example;
-- GNAT equivalent
gnatmake -z example.adb
-- Concurrency
with Ada.Text_IO; use Ada.Text_IO;

procedure Traffic is

   type Airplane_ID is range 1..10;             -- 10 airplanes

   task type Airplane (ID: Airplane_ID);        -- task representing airplanes, with ID as initialisation parameter
   type Airplane_Access is access Airplane;     -- reference type to Airplane

   protected type Runway is                     -- the shared runway (protected to allow concurrent access)
      entry Assign_Aircraft (ID: Airplane_ID);  -- all entries are guaranteed mutually exclusive
      entry Cleared_Runway (ID: Airplane_ID);
      entry Wait_For_Clear;
   private
      Clear: Boolean := True;                   -- protected private data - generally more than just a flag...
   end Runway;
   type Runway_Access is access all Runway;

   -- the air traffic controller task takes requests for takeoff and landing
   task type Controller (My_Runway: Runway_Access) is
      -- task entries for synchronous message passing
      entry Request_Takeoff (ID: in Airplane_ID; Takeoff: out Runway_Access);
      entry Request_Approach(ID: in Airplane_ID; Approach: out Runway_Access);
   end Controller;

   --  allocation of instances
   Runway1    : aliased Runway;              -- instantiate a runway
   Controller1: Controller (Runway1'Access); -- and a controller to manage it

   ------ the implementations of the above types ------
   protected body Runway is
      entry Assign_Aircraft (ID: Airplane_ID)
 when Clear is   -- the entry guard - calling tasks are blocked until the condition is true
      begin
       Clear := False;
       Put_Line (Airplane_ID'Image (ID) & " on runway ");
      end;

      entry Cleared_Runway (ID: Airplane_ID)
 when not Clear is
      begin
         Clear := True;
         Put_Line (Airplane_ID'Image (ID) & " cleared runway ");
      end;

      entry Wait_For_Clear
 when Clear is
      begin
         null;      -- no need to do anything here - a task can only enter if "Clear" is true
      end;
   end Runway;

   task body Controller is
   begin
      loop
         My_Runway.Wait_For_Clear;   -- wait until runway is available (blocking call)
         select                      -- wait for two types of requests (whichever is runnable first)
            when Request_Approach'count = 0 =>  -- guard statement - only accept if there are no tasks queuing on Request_Approach
             accept Request_Takeoff (ID: in Airplane_ID; Takeoff: out Runway_Access)
             do                                 -- start of synchronized part
               My_Runway.Assign_Aircraft (ID);  -- reserve runway (potentially blocking call if protected object busy or entry guard false)
               Takeoff := My_Runway;            -- assign "out" parameter value to tell airplane which runway
             end Request_Takeoff;               -- end of the synchronised part
         or
            accept Request_Approach (ID: in Airplane_ID; Approach: out Runway_Access) do
               My_Runway.Assign_Aircraft (ID);
               Approach := My_Runway;
            end Request_Approach;
         or                          -- terminate if no tasks left who could call
            terminate;
         end select;
      end loop;
   end;

   task body Airplane is
      Rwy : Runway_Access;
   begin
      Controller1.Request_Takeoff (ID, Rwy); -- This call blocks until Controller task accepts and completes the accept block
      Put_Line (Airplane_ID'Image (ID) & "  taking off...");
      delay 2.0;
      Rwy.Cleared_Runway (ID);               -- call will not block as "Clear" in Rwy is now false and no other tasks should be inside protected object
      delay 5.0; -- fly around a bit...
      loop
         select   -- try to request a runway
            Controller1.Request_Approach (ID, Rwy); -- this is a blocking call - will run on controller reaching accept block and return on completion
            exit; -- if call returned we're clear for landing - leave select block and proceed...
         or
            delay 3.0;  -- timeout - if no answer in 3 seconds, do something else (everything in following block)
            Put_Line (Airplane_ID'Image (ID) & "   in holding pattern");  -- simply print a message
         end select;
      end loop;
      delay 4.0;  -- do landing approach...
      Put_Line (Airplane_ID'Image (ID) & "            touched down!");
      Rwy.Cleared_Runway (ID);  -- notify runway that we're done here.
   end;

   New_Airplane: Airplane_Access;

begin
   for I in Airplane_ID'Range loop  -- create a few airplane tasks
      New_Airplane := new Airplane (I); -- will start running directly after creation
      delay 4.0;
   end loop;
end Traffic;
-- Comment type 1 (single line)
-- There is no body block comment type
-- End