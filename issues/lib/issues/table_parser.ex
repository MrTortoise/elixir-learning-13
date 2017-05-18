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


  def pad(number, character) when number >= 0, do: "#{character}#{pad(number-1)}"
  def pad(_), do: ""

  def header(%{issues: issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width}) do
    head = " ##{pad(id_width," ")}| created_at #{pad(created_at_width - 8," ")}| title#{pad(title_width-6, " ")}"
    %{issues: issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width, result: head}
  end

  def seperator(%{issues: issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width, result: data}) do
    data = "#{data}\r\n#{pad(id_width+2,"-")}+#{pad(created_at_width+2,"-")}+#{pad(title_width+2,"-")}"
    %{issues: issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width, result: data}
  end

  def rows(%{issues: issues, id_width: id_width, created_at_width: created_at_width, title_width: title_width, result: data}) do
    rows = for row <- issues, do: get_parsed_row(row, id_width, created_at_width, title_width)
    "#{data}\r\n#{Enum.join(rows, "\r\n")}"
  end

  def get_parsed_row(issue, _id_width, _created_at_width, _title_width) do
    "#{Map.get(issue, "id")}|#{Map.get(issue, "created_at")}|#{Map.get(issue, "title")}"
  end
end
