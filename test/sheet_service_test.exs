defmodule SheetServiceTest do
  use ExUnit.Case
  doctest SheetService

  test "process given file" do
    {result, _message} = SheetService.process()

    assert result == :ok
  end
end
