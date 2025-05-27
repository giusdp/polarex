defmodule Polarex.Generated.DownloadableRead do
  @moduledoc """
  Provides struct and type for a DownloadableRead
  """

  @type t :: %__MODULE__{
          benefit_id: String.t(),
          file: Polarex.Generated.FileDownload.t(),
          id: String.t()
        }

  defstruct [:benefit_id, :file, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      benefit_id: {:string, :generic},
      file: {Polarex.Generated.FileDownload, :t},
      id: {:string, :generic}
    ]
  end
end
