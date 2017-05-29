defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, {self(), fun.(elem) }) end
      end)
    |> Enum.map(fn (_pid) ->
      receive do { _pid, result} -> result end
    end)
  end
end
