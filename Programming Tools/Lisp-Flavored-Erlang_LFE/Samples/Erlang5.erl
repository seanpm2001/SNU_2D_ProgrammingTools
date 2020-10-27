handle_info(ping, #state {remote_pid = undefined} = State) ->
    gen_server:cast(self(), ping),
    {noreply, State};
handle_info(ping, State) ->
    {noreply, State};
