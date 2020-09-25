defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @spec process(file :: String.t()) :: {:ok, [struct()]}
  @doc """
  Process given path and return data
  """
  def process(file_path) do
    case Path.extname(file_path) do
      ".csv" ->
        {:ok,
         file_path
         |> File.stream!()
         |> Stream.map(fn row ->
           {:ok, row} = Codepagex.to_string(row |> remove_bom(), :iso_8859_1)

           row
         end)
         |> CSV.decode(separator: ?;, headers: true)
         |> Enum.to_list()}

      ".xlsx" ->
        {:ok, []}
    end
  end

  defp remove_bom(row) do
    row |> String.replace_prefix("\uFEFF", "")
  end
end
