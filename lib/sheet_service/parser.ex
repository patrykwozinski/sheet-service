defmodule SheetService.Parser do
  @callback parse(file_path :: String.t()) ::
              {:ok, list(struct())} | {:error, errors :: term}
end
