defmodule Issues.TableParser do

  def parse_table(issues) do
    %{
      issues: issues,
      id_width: get_id_width(issues),
      created_at_width: get_created_at_width(issues),
      title_width: get_title_width(issues)
    }
    |> header
    |> seperator
    |> rows
  end



  def get_id_width(issues) do
    widths = for issue <- issues, do: String.length(Integer.to_string(Map.get(issue, "id")))
    Enum.max(widths)
  end

  def get_longest_field(issues, field) do
    lengths = for issue <- issues, into: [],do: String.length(Map.get(issue, field))
    Enum.max(lengths)
  end

  def get_created_at_width(issues) do
    get_longest_field(issues, "created_at")
  end

  def get_title_width(issues) do
    get_longest_field(issues, "title")
  end


  def pad(number, character) when number > 0, do: "#{character}#{pad(number-1)}"
  def pad(_), do: ""

  def header(%{issues: _issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width}) do
    " ##{pad(id_width," ")}| created_at #{pad(created_at_width - 8," ")}| title#{pad(title_width-6, " ")}"
  end

  def seperator(%{issues: _issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width}) do
    "#{pad(id_width+2,"-")}+#{pad(created_at_width+2,"-")}+#{pad(title_width+2,"-")}"
  end

  def rows(_data) do

  end
end
