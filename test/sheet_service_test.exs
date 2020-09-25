defmodule SheetServiceTest do
  use ExUnit.Case

  describe "positive template 1" do
    test "csv processed" do
      assert {:ok, data} = SheetService.process(fixture_positive("tmpl1/CSV.csv"))

      IO.inspect(data)
    end
  end

  defp fixture_positive(name) do
    "test/fixtures/p/" <> name
  end
end
