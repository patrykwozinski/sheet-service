defmodule SheetService.Decoder.HelloWorldDecoder do
  @spec decode_file(File.t()) :: {atom, String.t()}
  def decode_file(_file) do
    {:ok, "hello world"}
  end
end
