connect_to_server (server: SOCKET)
      -- Connect to a server or give up after 10 attempts.
    require
        server /= Void and then server.address /= Void
    local
        attempts: INTEGER
    do
        server.connect
    ensure
      connected: server.is_connected
    rescue
        if attempts < 10 then
            attempts := attempts + 1
            retry
        end
    end

