defmodule SheetServiceTest do
  use ExUnit.Case
  doctest SheetService

  test "process given file" do
    {result, _message} = SheetService.process("test/fixtures/simple.csv")

    assert result == :ok
  end
end
