defmodule SheetService.Parser.CsvParserTest do
  use ExUnit.Case

  test "simple csv should be parsed succesfully" do
    {:ok, result} = SheetService.Parser.CsvParser.parse("test/fixtures/simple.csv")

    first_result = result |> List.first()

    assert result |> length() == 5
    assert first_result["country"] == "poland"
    assert first_result["email"] == "test1@test.com"
    assert first_result["first_name"] == "Lukasz"
    assert first_result["last_name"] == "Laz"
    assert first_result["revenue"] == "1000"
  end
end
