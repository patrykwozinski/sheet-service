defmodule SheetService.Parser do
  @callback parse(file_path :: String.t()) :: list(map())
end
