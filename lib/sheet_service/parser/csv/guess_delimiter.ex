defmodule SheetService.Parser.Csv.GuessDelimiter do
  @possible_delimiter [?;, ?,, ?\t]

  def guess_delimiter(file_stream) do
    file_stream
    |> CSV.decode(separator: ?\n)
    |> Enum.to_list()
    |> List.first()
    |> elem(1)
    |> List.first()
    |> to_charlist()
    |> Enum.reduce(%{}, fn char, acc ->
      IO.inspect(?;)

      Map.put(acc, char, (acc[char] || 0) + 1)
    end)
    |> IO.inspect()
  end
end
