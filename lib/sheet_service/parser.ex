defmodule SheetService.Parser do
  @moduledoc """
  Parses given file and returns simple format
  """
  @parser_implementation SheetService.Config.get(:parser)

  @doc """
  Parse file
  """
  @callback parse(file_path :: String.t()) ::
            {:ok, data :: []} | {:error, errors :: term}

  defdelegate parse(file_path), to: @parser_implementation
end
