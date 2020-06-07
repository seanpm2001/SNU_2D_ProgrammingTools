-- File version: 2 (October 12th 2019)
-- First version: 1 (February 7th 2019)
-- Latest version: 2 (October 12th 2019)
-- Concurrency Ada test
-- From: https://en.wikipedia.org/wiki/Ada_(programming_language)#Concurrency
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