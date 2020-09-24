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
    "simple.csv"
    |> SheetService.Detector.detect_encoding()
    |> encoding_validate()
    |> SheetService.Parser.parse()

    {:ok, "Sheet successfully processed"}
  end

  defp encoding_validate({:ok, file_path, "utf-8"}) do
    file_path
  end

  defp encoding_validate(:ok, file_path, _) do
    file_path
  end
end
