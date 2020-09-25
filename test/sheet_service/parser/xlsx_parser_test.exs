defmodule SheetService.Parser.XlsxParserTest do
  use ExUnit.Case

  test "simple xlsx should be parsed succesfully" do
    result = SheetService.Parser.XlsxParser.parse("test/fixtures/simple.xlsx")
    first_result = result |> List.first()

    assert result |> length() == 3
    assert first_result["country"] == "Germany"
    assert first_result["email"] == "andreas@email.de"
    assert first_result["first_name"] == "Andreaß"
    assert first_result["last_name"] == "Fischer"
    assert first_result["size"] == "L"
    assert first_result["height"] == "L"
    assert first_result["width"] == "L"
    assert first_result["gender"] == "M"
  end
end
