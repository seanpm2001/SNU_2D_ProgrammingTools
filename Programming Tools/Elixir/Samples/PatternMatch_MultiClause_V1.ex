iex> case File.read("path/to/file") do
iex>   {:ok, contents} -> IO.puts("found file: #{contents}")
iex>   {:error, reason} -> IO.puts("missing file: #{reason}")
iex> end
