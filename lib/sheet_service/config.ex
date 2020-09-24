defmodule SheetService.Config do
  @spec get(String.t()) :: SheetService.Detector.AlwaysUtf8
  def get(_name) do
    SheetService.Detector.AlwaysUtf8
  end
end
