defmodule SheetService.Parser.XlsxParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    IO.inspect(
      file_path
      |> Xlsxir.stream_list(0)
      |> Enum.to_list()
    )

    {:ok, []}
  end
end
