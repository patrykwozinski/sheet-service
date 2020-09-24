defmodule SheetServiceTest do
  use ExUnit.Case
  doctest SheetService

  test "process given csv file" do
    {status, result} = SheetService.process("test/fixtures/simple.csv")

    {_, first} =
      result
      |> List.first()

    assert status == :ok
    assert first["country"] == "poland"
    assert first["email"] == "test1@test.com"
    assert first["first_name"] == "Lukasz"
    assert first["last_name"] == "Laz"
    assert first["revenue"] == "1000"
  end

  test "process given xlsx file" do
    {status, _result} = SheetService.process("test/fixtures/simple.xlsx")

    assert status == :ok
  end
end
