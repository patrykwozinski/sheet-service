defmodule SheetService.Detector.AlwaysUtf8Test do
  use ExUnit.Case

  test "it is always utf-8" do
    assert SheetService.Detector.AlwaysUtf8.detect_encoding(nil) == "utf-8"
  end
end
