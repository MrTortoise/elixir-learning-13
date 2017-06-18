defmodule StackTest do
  use ExUnit.Case

  test "initialise a stack, get initialise back" do
    {:ok, pid} = GenServer.start_link(Sequence.Stack, [1,2,3])
    result = GenServer.call(pid, :pop)
    result2 = GenServer.call(pid, :pop)
    result3 = GenServer.call(pid, :pop)
    assert result == 1
    assert result2 == 2
    assert result3 == 3
  end

end
