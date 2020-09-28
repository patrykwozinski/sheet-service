defmodule SheetServiceTest do
  use ExUnit.Case

  describe "positive template 1" do
    test "csv processed" do
      assert {:ok, data} = SheetService.process(fixture_positive("tmpl1/CSV.csv"))

      first_result = data |> List.first()

      assert length(data) == 3
      assert first_result["email"] == "andreas@email.de"
      assert first_result["first_name"] == "Andrea§"
      assert first_result["last_name"] == "Fischer"
    end
  end

  defp fixture_positive(name) do
    "test/fixtures/p/" <> name
  end
end
