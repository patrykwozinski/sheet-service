defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @doc """
  Process given path and return data
  """
  def process(file_path) do
    IO.inspect(
      file_path
      |> File.stream!()
      |> Stream.map(fn row ->
        {:ok, row} = Codepagex.to_string(row, :iso_8859_1)

        row
      end)
      |> CSV.decode(separator: ?;)
      |> Enum.to_list()
    )

    {:ok, "Sheet successfully processed"}
  end
end
