defmodule MultipleProcesses do
  import :timer, only: [sleep: 1]


  def sendQuit(parent) do
    IO.puts "send Quit started"
    send parent, {:howdy}
    exit(:boom)
  end

  def startSleepWhat do
    IO.puts "starting sendQuit"
    spawn_link(MultipleProcesses, :sendQuit, [self()])
    IO.puts "about to sleep"
    sleep 500
    IO.puts "woken"
    receive do
      {:howdy, contents} ->
        IO.puts "Howdy message #{contents}"
        startSleepWhat()
      {:boom, contents} ->
        IO.puts "boom #{contents}"
        startSleepWhat()
    end
  end
end
