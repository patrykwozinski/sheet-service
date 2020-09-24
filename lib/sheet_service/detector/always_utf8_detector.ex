defmodule SheetService.Detector.AlwaysUtf8 do
  @moduledoc false
  @behaviour SheetService.Detector

  def detect_encoding(_file_path) do
    {:ok, "utf-8"}
  end
end
