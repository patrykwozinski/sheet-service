defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @doc """
  Process given path and return data
  """
  def process(file_path) do
    data =
      file_path
      |> File.stream!()
      |> Stream.map(fn row ->
        {:ok, row} = Codepagex.to_string(row |> remove_bom(), :iso_8859_1)

        row
      end)
      |> CSV.decode(separator: ?;, headers: true)
      |> Enum.to_list()

    {:ok, data}
  end

  defp remove_bom(row) do
    row |> String.replace_prefix("\uFEFF", "")
  end
end
