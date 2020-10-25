for num <- 1..1000, do: spawn fn -> IO.puts("#{num * 2}") end
