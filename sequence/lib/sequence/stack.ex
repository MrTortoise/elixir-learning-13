defmodule Sequence.Stack do
  use GenServer

  def handle_call({:initialise,stack}, _from, _current_stack) do
    {:reply, :initialised, stack}
  end

  def handle_call(:pop, _from, stack) do
    [head|tail] = stack
    {:reply, head, tail}
  end
end
