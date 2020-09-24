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

    IO.inspect SheetService.Parser.parse(file_path)

    case File.open("simple.csv", [:read]) do
      {:ok, file} -> SheetService.Detector.detect_encoding(file)
      {:error, _} -> nil
    end

    {:ok, "Sheet successfully processed"}
  end
end
