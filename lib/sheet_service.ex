defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @doc """
  Process given path and return data

  ## Examples

      iex> SheetService.process()
      {:ok, "Sheet successfully processed"}
  """
  def process do
    IO.inspect(
      "simple.csv"
      |> File.stream!()
      |> CSV.decode(separator: ?;)
      |> Enum.map(fn {:ok, row} ->
        {:ok, Enum.map(row, fn field ->
          {:ok, decoded} = Codepagex.to_string(field, :iso_8859_1)

          decoded
        end) }
      end)
      |> Enum.to_list()
    )

    "simple.csv"
    |> SheetService.Detector.detect_encoding()
    |> validate_encoding()
    |> SheetService.Parser.parse()

    {:ok, "Sheet successfully processed"}
  end

  defp validate_encoding({:ok, file_path, "utf-8"}) do
    file_path
  end
end
