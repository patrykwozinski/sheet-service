defmodule SheetService.Decoder do
  @moduledoc """
  Reads and encodes given file
  """
  @decoder_implementation SheetService.Config.get(:decoder)

  @doc """
  Detects encoding of given file and returns encoding type
  """
  @callback decode_file(file :: String.t()) ::
            {:ok, encoding :: String.t()} | {:error, errors :: term}

  defdelegate decode_file(file), to: @decoder_implementation
end
