defmodule Polarex.Generated.S3FileUploadCompletedPart do
  @moduledoc """
  Provides struct and type for a S3FileUploadCompletedPart
  """

  @type t :: %__MODULE__{
          checksum_etag: String.t(),
          checksum_sha2_56_base6_4: String.t() | nil,
          number: integer
        }

  defstruct [:checksum_etag, :checksum_sha2_56_base6_4, :number]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checksum_etag: {:string, :generic},
      checksum_sha2_56_base6_4: {:union, [{:string, :generic}, :null]},
      number: :integer
    ]
  end
end
