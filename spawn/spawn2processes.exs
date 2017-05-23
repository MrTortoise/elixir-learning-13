defmodule Spawn2Processes do
  def echo do
    receive do
      {sender, msg} -> send sender, msg
    end
  end
end


pid1 = spawn(Spawn2Processes, :echo, [])
pid2 = spawn(Spawn2Processes, :echo, [])

send pid1, {self(), "fred"}
send pid2, {self(), "dave"}

receive do
  val -> IO.puts(val)
end


receive do
  val -> IO.puts(val)
end
