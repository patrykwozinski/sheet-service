defmodule SheetServiceTest do
  use ExUnit.Case
  doctest SheetService

  test "greets the world" do
    assert SheetService.hello() == :world
  end
end
