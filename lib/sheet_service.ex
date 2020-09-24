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
    file_path = "simple.csv"

    file_path
    |> SheetService.Detector.detect_encoding()
    |> is_valid()
    |> SheetService.Parser.parse()

    {:ok, "Sheet successfully processed"}
  end

  defp is_valid({:ok, file_path, encoding}) do
    case encoding do
       "utf-8" -> file_path
        _ -> nil
    end
  end
end
