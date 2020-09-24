defmodule SheetService.Detector.AlwaysUtf8 do
  @moduledoc false
  @behaviour SheetService.Detector

  @spec detect_encoding(binary) :: {:ok, binary, String.t()}
  def detect_encoding(file) do
    {:ok, file, "utf-8"}
  end
end
