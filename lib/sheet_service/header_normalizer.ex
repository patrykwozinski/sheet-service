defmodule SheetService.HeaderNormalizer do
  @spec normalize(list(String.t())) :: [list(String.t())]
  def normalize(header) do
    header
    |> Enum.map(fn value ->
      value
      |> String.downcase()
      |> String.replace(" ", "_")
    end)
  end
end
