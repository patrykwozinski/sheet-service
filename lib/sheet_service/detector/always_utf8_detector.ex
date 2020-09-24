defmodule SheetService.Detector.AlwaysUtf8 do
  @moduledoc false
  @behaviour SheetService.Detector

  def detect_encoding(file_path) do
    {:ok, file_path, "utf-8"}
  end
end
