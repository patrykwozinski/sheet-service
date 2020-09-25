defmodule SheetService.Parser.XlsxParser do
  @behaviour SheetService.Parser

  def parse(file_path) do
    {:ok, document} =
      file_path
      |> XlsxReader.open()

    sheet_name =
      document
      |> XlsxReader.sheet_names()
      |> List.first()

    {:ok, sheet} = XlsxReader.sheet(document, sheet_name)

    headers = sheet
    |> List.first()
    |> SheetService.HeaderNormalizer.normalize()

    IO.inspect(headers)

    {:ok, []}
  end
end
