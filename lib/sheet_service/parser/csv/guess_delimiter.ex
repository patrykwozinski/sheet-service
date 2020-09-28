defmodule SheetService.Parser.Csv.GuessDelimiter do
  @possible_delimiter [?;, ?,, ?\t]

  def guess_delimiter(file_stream) do
    delimiter = file_stream
    |> CSV.decode(separator: ?\n)
    |> Enum.to_list()
    |> List.first()
    |> elem(1)
    |> List.first()
    |> to_charlist()
    |> Enum.filter(fn char -> Enum.member?(@possible_delimiter, char) end)
    |> Enum.reduce(%{}, fn char, acc ->
      Map.put(acc, char, (acc[char] || 0) + 1)
    end)
    |> Enum.max_by(fn {_, acc} ->
      acc
    end)
    {character, _} = delimiter

    character
  end
end
