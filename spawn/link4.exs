defmodule Link4 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit,true)
    res =   spawn_monitor(Link4, :sad_function, [])
    IO.puts inspect res
    receive do
      msg -> IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
    IO.puts "nothing happened"
    end
  end


end

Link4.run
