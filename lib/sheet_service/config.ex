defmodule SheetService.Config do
  @spec get(String.t()) :: SheetService.Detector.Dummy
  def get(_name) do
    SheetService.Detector.Dummy
  end
end
