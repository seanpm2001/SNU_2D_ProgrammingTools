require "socket"

def handle_client(client)
  message = client.gets
  client.puts message
end

server = TCPServer.new("localhost", 1234)
while client = server.accept?
  spawn handle_client(client)
end
