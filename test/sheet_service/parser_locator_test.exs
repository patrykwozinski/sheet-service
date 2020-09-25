defmodule SheetService.Parser.ParserLocatorTest do
  use ExUnit.Case

  test "should find csv parser when csv file given" do
    assert {:ok, parser} =
             SheetService.ParserLocator.find_by_extension("test/fixtures/simple.csv")

    assert parser == SheetService.Parser.CsvParser
  end

  test "should not find parser when invalid file path" do
    assert {:error, :parser_not_found} =
             SheetService.ParserLocator.find_by_extension("test/fixtures/wrong_ext.invalid")
  end
end
