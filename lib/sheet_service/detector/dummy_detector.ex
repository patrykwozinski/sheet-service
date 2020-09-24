defmodule SheetService.Detector.Dummy do
  @moduledoc false
  @behaviour SheetService.Detector

  def detect_encoding(_file) do
    {:ok, "utf-8"}
  end
end
