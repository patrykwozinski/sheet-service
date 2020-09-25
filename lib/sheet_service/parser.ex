defmodule SheetService.Parser do
  @callback parse(file_path :: String.t()) ::
              {:ok, list(map())} | {:error, errors :: term}
end
