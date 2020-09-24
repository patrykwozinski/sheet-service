defmodule SheetService.Config do
  @spec get(String.t()) :: any
  def get(name) do

    case name do
      :detector -> SheetService.Detector.AlwaysUtf8
      :parser -> SheetService.Parser.CsvParser
      _ -> nil
    end
  end
end
