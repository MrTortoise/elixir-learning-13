defmodule CliTest do
  #import Issues.CLI, only: [parse_args: 1, sort_into_ascending_order: 1]
  import Issues.CLI, only: [sort_into_ascending_order: 1]
  use ExUnit.Case
  doctest Issues.CLI

  test "sort ascending orders items in the correct way" do
    result = sort_into_ascending_order(fake_created_at_list(["c","b","a"]))
    issues = for issue <- result, do: Map.get(issue, "created_at")
    assert issues == ~w{a b c}
  end

  def fake_created_at_list(values) do
    for value <- values,
    do: %{"created_at" => value, "other_data" => "xxx"}
  end
end
