defmodule SheetService do
  @moduledoc """
  Mechanism that allows us to process sheets with `.csv` and `.xlsx` extensions.
  """

  @spec process(file :: String.t()) :: {:ok, [struct()]}
  @doc """
  Process given path and return data
  """
  def process(file_path) do
    with {:ok, parser} <- SheetService.ParserLocator.find_by_extension(file_path) do
      parser.parse(file_path)
    end
  end
end
