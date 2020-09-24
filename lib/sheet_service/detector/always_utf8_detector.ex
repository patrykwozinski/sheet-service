defmodule SheetService.Detector.AlwaysUtf8 do
  @moduledoc false
  @behaviour SheetService.Detector

  @spec detect_encoding(binary) :: {:ok, String.t()}
  def detect_encoding(_file) do
    {:ok, "utf-8"}
  end
end
