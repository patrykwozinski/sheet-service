defmodule SheetService.Config do
  @spec get(String.t()) :: any
  def get(name) do

    case name do
      :detector -> SheetService.Detector.AlwaysUtf8
      :decoder -> SheetService.Decoder.HelloWorldDecoder
      _ -> nil
    end
  end
end
