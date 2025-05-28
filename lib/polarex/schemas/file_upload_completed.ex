defmodule Polarex.FileUploadCompleted do
  @moduledoc """
  Provides struct and type for a FileUploadCompleted
  """

  @type t :: %__MODULE__{
          id: String.t(),
          parts: [Polarex.S3FileUploadCompletedPart.t()],
          path: String.t()
        }

  defstruct [:id, :parts, :path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      parts: [{Polarex.S3FileUploadCompletedPart, :t}],
      path: {:string, :generic}
    ]
  end
end
