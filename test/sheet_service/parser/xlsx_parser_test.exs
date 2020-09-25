defmodule SheetService.Parser.XlsxParserTest do
  use ExUnit.Case

  test "simple xlsx should be parsed succesfully" do
    {:ok, result} = SheetService.Parser.XlsxParser.parse("test/fixtures/simple.xlsx")

    {:ok, first_result} = result |> List.first()

    assert first_result["country"] == "poland"
    assert first_result["email"] == "test1@test.com"
    assert first_result["first_name"] == "Lukasz"
    assert first_result["last_name"] == "Laz"
    assert first_result["revenue"] == "1000"
  end
end
