defmodule MultipleProcesses do
  import :timer, only: [sleep: 1]


  def sendQuit(parent) do
    IO.puts "send Quit started"
    send parent, {:howdy}
    raise "Exception yo"
    exit(:boom)
  end

  def startSleepWhat do
    IO.puts "starting sendQuit"
    res = spawn_monitor(MultipleProcesses, :sendQuit, [self()])
    IO.puts inspect res
    IO.puts "about to sleep"
    sleep 500
    IO.puts "woken"
    receive do
      msg ->
        IO.puts "Howdy message #{inspect msg}"

      after 1000 -> IO.puts "that all folks"
    end
  end
end

MultipleProcesses.startSleepWhat()
