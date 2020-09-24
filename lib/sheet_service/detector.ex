defmodule SheetService.Detector do
  @moduledoc """
  Allows to detect encoding of given file
  """

  @doc """
  Detects encoding of given file and returns encoding type
  """
  @callback detect_encoding(file :: String.t()) ::
            {:ok, encoding :: String.t()} | {:error, errors :: term}
end
