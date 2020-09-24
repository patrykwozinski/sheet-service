defmodule SheetServiceTest do
  use ExUnit.Case
  doctest SheetService

  test "process given csv file" do
    {status, result} = SheetService.process("test/fixtures/simple.csv")

    assert status == :ok
  end
end
