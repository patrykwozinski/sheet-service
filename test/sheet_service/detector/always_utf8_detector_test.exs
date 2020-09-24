defmodule SheetServiceTest.Detector.AlwaysUtf8Test do
  use ExUnit.Case

  test "it is always utf-8" do
    assert {:ok, nil, "utf-8"} == SheetService.Detector.AlwaysUtf8.detect_encoding(nil)
  end
end
