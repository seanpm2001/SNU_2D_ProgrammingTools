 % Create a process and invoke the function web:start_server(Port, MaxConnections)
 ServerProcess = spawn(web, start_server, [Port, MaxConnections]),

 % Create a remote process and invoke the function
 % web:start_server(Port, MaxConnections) on machine RemoteNode
 RemoteProcess = spawn(RemoteNode, web, start_server, [Port, MaxConnections]),

 % Send a message to ServerProcess (asynchronously). The message consists of a tuple
 % with the atom "pause" and the number "10".
 ServerProcess ! {pause, 10},

 % Receive messages sent to this process
 receive
         a_message -> do_something;
         {data, DataContent} -> handle(DataContent);
         {hello, Text} -> io:format("Got hello message: ~s", [Text]);
         {goodbye, Text} -> io:format("Got goodbye message: ~s", [Text])
 end.