defmodule SheetService.Detector do
  @moduledoc """
  Allows to detect encoding of given file
  """
  @detector_implementation SheetService.Config.get(:detector)

  @doc """
  Detects encoding of given file and returns encoding type
  """
  @callback detect_encoding(file_path :: String.t()) ::
            {:ok, file_path :: String.t(), encoding :: String.t()} | {:error, errors :: term}

  defdelegate detect_encoding(file), to: @detector_implementation
end
