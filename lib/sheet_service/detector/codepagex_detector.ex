defmodule SheetService.Detector.CodepagexDetector do
  @moduledoc false
  @behaviour SheetService.Detector

  def detect_encoding(file_path) do
    {:ok, file_path, "utf-8"}

      File.stream!(file_path) |> Codepagex.to_string()
  end
end
